from wazimap.data.tables import get_datatable
from wazimap.data.utils import get_session, merge_dicts, get_stat_data, percent
from wazimap.geo import geo_data


PROFILE_SECTIONS = (
    "demographics",
    "depravation"
)

def get_profile(geo_code, geo_level, profile_name=None):
    session = get_session()

    try:
        geo_summary_levels = geo_data.get_summary_geo_info(geo_code, geo_level)
        data = {}
        sections = list(PROFILE_SECTIONS)
        if geo_level not in ['country', 'province', 'district', 'municipality']:
            pass
            # Raise error as we don't have this data

        for section in sections:
            function_name = 'get_%s_profile' % section
            if function_name in globals():
                func = globals()[function_name]
                data[section] = func(geo_code, geo_level, session)

                # get profiles for province and/or country
                for level, code in geo_summary_levels:
                    # merge summary profile into current geo profile
                    merge_dicts(data[section], func(code, level, session), level)


        return data

    finally:
        session.close()


def get_demographics_profile(geo_code, geo_level, session):
    # population group
    pop_dist_data, pop_total = get_stat_data(
            ['population group'], geo_level, geo_code, session)

    youth_pop_dist_data, youth_pop_total = get_stat_data(['age in completed years'], geo_level, geo_code, session, table_name='youth_gender_age_in_completed_years')

    youth_gender_data, _ = get_stat_data(['gender'], geo_level, geo_code, session, table_name='youth_gender_population_group')
    youth_pop_group_data, _ = get_stat_data(['population group'], geo_level, geo_code, session, table_name='youth_gender_population_group')

    final_data = {
        'total_population': {
            "name": "People",
            "values": {"this": pop_total}
        },
        'youth_population_total': {
            "name": "Youth aged 15-24",
            "values": {"this": youth_pop_total}
        },
        'youth_population_perc': {
            "name": "Of population are youth aged 15-24",
            "values": {"this": percent(youth_pop_total, pop_total)},
        },
        'youth_population_by_year': youth_pop_dist_data,
        'youth_population_by_gender': youth_gender_data,
        'youth_population_by_pop_group': youth_pop_group_data
    }

    geo = geo_data.get_geography(geo_code, geo_level)
    if geo.square_kms:
        final_data['population_density'] = {
            'name': "people per square kilometre",
            'values': {"this": pop_total / geo.square_kms}
        }

    return final_data


def get_depravation_profile(geo_code, geo_level, session):
    table = get_datatable('youth').model
    (youth_pop, youth_prop, edu_dep, disab_dep, light_dep, heat_dep,
    cook_dep, toilet_dep, water_dep, dwell_dep, asset_dep, emp_dep,
    neets_dep, prop_multid_poor, youth_mpi) = session.query(
            table.c.youth_pop,
            table.c.youth_proportion,
            table.c.edu_dep,
            table.c.disab_dep,
            table.c.light_dep,
            table.c.heat_dep,
            table.c.cook_dep,
            table.c.toilet_dep,
            table.c.water_dep,
            table.c.dwell_dep,
            table.c.asset_dep,
            table.c.emp_dep,
            table.c.neets_dep,
            table.c.prop_multid_poor,
            table.c.youth_mpi) \
        .filter(table.c.geo_level == geo_level) \
        .filter(table.c.geo_code == geo_code) \
        .one()

    return {
        'name': 'youth',
        'youth_pop': {
            "name": "Population (age 15-24)",
            "values": {"this": youth_pop},
            },
        'youth_prop': {
            "name": "Youth (age 15-24) as a percentage of total population",
            "values": {"this": float(youth_prop) or 0.0},
            },
        'edu_dep': {
            "name": "Deprived in educational attainment *",
            "values": {"this": float(edu_dep) or 0.0},
            },
        'disab_dep': {
            "name": "Experiencing difficulty in one or more of the following functions: hearing, vision, communication, mobility, cognition and self-care",
            "values": {"this": float(disab_dep) or 0.0},
            },
        'light_dep': {
            "name": "Living in households without energy for light *",
            "values": {"this": float(light_dep) or 0.0},
            },
        'heat_dep': {
            "name": "Living in households without energy for heat *",
            "values": {"this": float(heat_dep) or 0.0},
            },
        'cook_dep': {
            "name": "Living in households without energy for cooking *",
            "values": {"this": float(cook_dep) or 0.0},
            },
        'toilet_dep': {
            "name": "Living in households without a flush toilet",
            "values": {"this": float(toilet_dep) or 0.0},
            },
        'water_dep': {
            "name": "Living in households without piped water on site",
            "values": {"this": float(water_dep) or 0.0},
            },
        'dwell_dep': {
            "name": "Living in households that are informal shacks/traditional dwellings/caravans/tents/other",
            "values": {"this": float(dwell_dep) or 0.0},
            },
        'asset_dep': {
            "name": "Living in households that do not own more than two of the following 'small' assets: radio, TV, landline, mobile phone, bike, motorbike or refrigerator AND does not own a car or truck",
            "values": {"this": float(asset_dep) or 0.0},
            },
        'emp_dep': {
            "name": "Living in households where no working-age adults (age 18-64) are employed ",
            "values": {"this": float(emp_dep) or 0.0},
            },
        'neets_dep': {
            "name": "Not in education, employment or training",
            "values": {"this": float(neets_dep) or 0.0},
            },
        'prop_multid_poor': {
            "name": "considered Multidimensionally poor",
            "values": {"this": float(prop_multid_poor) or 0.0},
            },
        'youth_mpi': {
            "name": "Youth Multidimensional Poverty Index score",
            "values": {"this": float(youth_mpi) or 0.0},
            }
    }
