from collections import OrderedDict

from wazimap.data.tables import get_datatable
from wazimap.data.utils import get_session, merge_dicts, get_stat_data, percent, current_context, dataset_context, group_remainder
from wazimap.geo import geo_data


PROFILE_SECTIONS = (
    "demographics",
    "education",
    "economic_opportunities",
    "living_environment",
    "poverty",
    "safety",
    "health"
)

POPULATION_GROUP_ORDER = (
    'Black African', 'Coloured', 'Indian or Asian', 'White', 'Other')
POPULATION_GROUP_ORDER_2016 = (
    'Black African', 'Coloured', 'Indian or Asian', 'White')
GENDER_ORDER = (
    'Female', 'Male')
PROVINCE_ORDER = (
    'Eastern Cape', 'Free State', 'Gauteng', 'KwaZulu-Natal', 'Limpopo', 'Mpumalanga',
    'North West', 'Northern Cape', 'Western Cape', 'Outside South Africa', 'Unspecified')
REGION_ORDER = (
    'South Africa', 'SADC', 'Rest of Africa', 'Other', 'Unspecified')
CITIZENSHIP_ORDER = (
    'Yes', 'No', 'Unspecified')
EDUCATION_LEVEL_KEY_ORDER = (
    'Less than Grade9', 'Grade 9', 'Grade 10/11', 'Matric/matric equivalent', 'Any tertiary')
EMPLOYMENT_STATUS_KEY_ORDER = (
    'Employed', 'Unemployed', 'Discouraged work-seeker', 'Other not economically active')
EMPLOYMENT_SECTOR_KEY_ORDER = (
    'Formal sector', 'Informal sector', 'Private household', 'Do not know')
EMP_EDU_TRAIN_KEY_ORDER = (
    'NEET','School/post-school', 'Employed')
HH_EMPLOYMENT_KEY_ORDER = (
    'No employed adult', 'At least one employed adult')
ELECTRICITY_ACCESS_KEY_ORDER = (
    'No electricity', 'Have electricity for some things', 'Have electricity for everything')
TOILET_ACCESS_KEY_ORDER = (
    'No toilet facilities', 'Flush toilet', 'Pit latrine-ventilated', 'Chemical toilet',
    'Unventilated pit latrine/Bucket toilet', 'Other')
WATER_ACCESS_KEY_ORDER = (
    'No piped water', 'On site', '< 1km', '> 1km')
TYPE_OF_DWELLING_ORDER = (
    'Formal', 'Informal not in backyard', 'Informal in backyard', 'Traditional', 'Other')
INTERNET_ACCESS_ORDER = (
    'From home', 'From cell phone', 'From work', 'From elsewhere', 'No access to internet')
TYPE_OF_AREA_ORDER = (
    'Formal residential', 'Informal residential', 'Traditional residential', 'Farms',
    'Parks and recreation', 'Collective living quarters', 'Industrial', 'Small holdings',
    'Vacant', 'Commercial')
TYPE_OF_AREA_ORDER_2016 = (
    'Farm areas', 'Tribal/Traditional areas', 'Urban areas')
HH_CROWDED_KEY_ORDER = (
    'Overcrowded', 'Non-overcrowded')
LIVING_WITH_PARENTS_KEY_ORDER = (
    'Both parents', 'Mother only', 'Father only', 'Neither parent')
DIFFICULTY_FUNCTIONING_KEY_ORDER = (
    'Seeing, even when using eye glasses', 'Hearing, even when using a hearing aid',
    'Communication', 'Walking', 'Remembering', 'Self care')
GIVEN_BIRTH_KEY_ORDER = (
    'Given birth', 'Never given birth', 'Do not know', 'Unspecified')


INCOME_POVERTY_AGE_GROUP_RECODE = {
    'age group': {
        '0-14': 'Children (0-14)',
        '15-24': 'Youth (15-24)',
        '25-34': 'Adults (25+)',
        '35-44': 'Adults (25+)',
        '45-54': 'Adults (25+)',
        '55-64': 'Adults (25+)',
        '65+': 'Adults (25+)',
    }
}

GIVEN_BIRTH_AGE_GROUP_RECODE = {
    'age in completed years': {
        '15':'15-19',
        '16':'15-19',
        '17':'15-19',
        '18':'15-19',
        '19':'15-19',
        '20':'20-24',
        '21':'20-24',
        '22':'20-24',
        '23':'20-24',
        '24':'20-24'
    }
}

def get_profile(geo, profile_name, request):
    session = get_session()

    try:
        comp_geos = geo_data.get_comparative_geos(geo)
        data = {}
        sections = list(PROFILE_SECTIONS)
        if geo.geo_level not in ['country', 'province', 'district', 'municipality']:
            pass
            # Raise error as we don't have this data

        """
        The following is temporary and enables us to determine what to display for geos:

        Within WC: All indicators, with WC as root comparisson geo
        Outside WC: Some indicators, with ZA as root comparrison geo

        This is beacause Wazimap expects data for all geos.
        This will be removed once we have imported all the data.
        """
        # There are datasets with only WC information
        display_profile = 'WC' if (geo.geo_code == 'WC' or 'WC' in [cg.geo_code for cg in comp_geos]) else 'ZA'

        data['display_profile'] = display_profile
        data['primary_release_year'] = current_context().get('year')

        for section in sections:
            function_name = 'get_%s_profile' % section

            if function_name in globals():
                func = globals()[function_name]
                data[section] = func(geo, session, display_profile)

                # get profiles for province and/or country
                for comp_geo in comp_geos:
                    # merge summary profile into current geo profile
                    merge_dicts(data[section], func(comp_geo, session, display_profile, comparative=True), comp_geo.geo_level)

        # Make data look nicer on profile page
        group_remainder(data['demographics']['youth_population_by_language'], 11)

        return data

    finally:
        session.close()


def get_demographics_profile(geo, session, display_profile, comparative=False):
    youth_pop_table = get_datatable('youth_population')
    youth_pop, pop_total = youth_pop_table.get_stat_data(
        geo, total='total_pop', percent='False')

    youth_age_group_data, _ = get_stat_data(
        ['age groups in 10 years'], geo, session,
        table_universe='Population',
        table_dataset='Census and Community Survey')

    youth_gender_data, _ = get_stat_data(
        ['gender'], geo, session,
        table_fields = ['gender', 'population group'],
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        key_order=GENDER_ORDER)

    population_group_order = (POPULATION_GROUP_ORDER_2016
        if current_context().get('year') == 'latest'
        else POPULATION_GROUP_ORDER)

    youth_pop_group_data, _ = get_stat_data(
        ['population group'], geo, session,
        table_fields = ['population group', 'gender'],
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        table_name='youth_population_group_gender',
        key_order=population_group_order)

    youth_language_data, _ = get_stat_data(
        ['language'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        order_by='-total'
    )
    youth_language_most_spoken = youth_language_data[youth_language_data.keys()[0]]

    youth_province_birth_data, _ = get_stat_data(
        ['province of birth'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        key_order=PROVINCE_ORDER)

    youth_region_birth_data, _ = get_stat_data(
        ['region of birth'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        key_order=REGION_ORDER)

    youth_region_birth_data['SADC']['name'] = 'SADC*'

    youth_citizenship_data, _ = get_stat_data(
        ['citizenship'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        key_order=CITIZENSHIP_ORDER)

    final_data = {
        'total_population': {
            "name": "People",
            "values": {"this": pop_total}
        },
        'youth_population_total': {
            "name": "Youth aged 15-24",
            "values": {"this": youth_pop['youth_pop']['numerators']['this']}
        },
        'youth_population_perc': {
            "name": "Of the population are youth aged 15-24",
            "values": {"this": youth_pop['youth_pop']['values']['this']},
        },
        'youth_population_by_age_group': youth_age_group_data,
        'youth_population_by_gender': youth_gender_data,
        'youth_population_by_pop_group': youth_pop_group_data,
        'youth_language_most_spoken': youth_language_most_spoken,
        'youth_population_by_language': youth_language_data,
        'youth_born_in_sa': {
            "name": "Of the youth population were born in South Africa",
            "values": {"this": youth_region_birth_data['South Africa']['values']['this']},
        },
        'youth_by_province_of_birth': youth_province_birth_data,
        'youth_by_region_of_birth': youth_region_birth_data,
        'youth_sa_citizenship': {
            'name': 'of the youth population are South African citizens',
            'values': {'this': youth_citizenship_data['Yes']['values']['this']}
        },
        'youth_by_citizenship': youth_citizenship_data,
    }

    # The following info is displayed in the block over the map
    if geo.square_kms:
        final_data['population_density'] = {
            'name': "youth per square kilometre",
            'values': {"this": youth_pop['youth_pop']['numerators']['this'] / geo.square_kms}
        }

    return final_data


def get_education_profile(geo, session, display_profile, comparative=False):
    youth_completed_grade9, _ = get_stat_data(
        ['completed grade9'], geo, session,
        table_universe='Youth aged 16 to 17',
        table_dataset='Census and Community Survey',
        key_order=('Completed', 'Not completed'))

    youth_completed_grade9_by_gender, _ = get_stat_data(
        ['completed grade9', 'gender'], geo, session,
        table_universe='Youth aged 16 to 17',
        table_dataset='Census and Community Survey',
        percent_grouping=['gender'], slices=['Completed'],
        key_order={'gender': GENDER_ORDER})

    youth_education_level, youth_pop_20_to_24 = get_stat_data(
        ['education level'], geo, session,
        table_universe='Youth aged 20 to 24',
        table_dataset='Census and Community Survey',
        key_order=EDUCATION_LEVEL_KEY_ORDER)

    youth_perc_matric = None
    if youth_education_level['Matric/matric equivalent']['numerators']['this']:
        matric_or_equiv = (
                youth_education_level['Matric/matric equivalent']['numerators']['this'] +
                youth_education_level['Any tertiary']['numerators']['this'])
        youth_perc_matric = percent(matric_or_equiv, youth_pop_20_to_24)

    youth_education_attendance, _ = get_stat_data(
        ['attendance'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        table_fields=['attendance', 'age in completed years', 'gender'])

    youth_education_attending_by_age, _ = get_stat_data(
        ['attendance', 'age in completed years'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        table_fields=['attendance', 'age in completed years', 'gender'],
        table_name='youth_education_attendance_age_incompleted_years_gender',
        percent_grouping=['age in completed years'], slices=['Yes'])

    youth_education_attending_by_gender, _ = get_stat_data(
        ['attendance', 'gender'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        table_fields=['attendance', 'age in completed years', 'gender'],
        percent_grouping=['gender'], slices=['Yes'],
        key_order={'gender': GENDER_ORDER})

    final_data = {
        'youth_completed_grade9': youth_completed_grade9,
        'youth_perc_completed_grade9': {
            'name': 'Of youth aged 16-17 have completed grade 9 or higher',
            'values': {'this': youth_completed_grade9['Completed']['values']['this']}
        },
        'youth_completed_grade9_by_gender': youth_completed_grade9_by_gender,
        'youth_education_level': youth_education_level,
        'youth_perc_matric': {
            "name": "Of youth aged 20-24 have completed matric/matric equivalent or higher",
            "values": {"this": youth_perc_matric}
        },
        'youth_perc_attending': {
            "name": "Of youth aged 15-24 attend an educational institution",
            "values": {"this": youth_education_attendance['Yes']['values']['this']}
        },
        'youth_education_attending_by_age': youth_education_attending_by_age,
        'youth_education_attending_by_gender': youth_education_attending_by_gender,
    }

    if display_profile == 'WC':
        with dataset_context(year='2017'):
            youth_average_mean_score_by_year, _ = get_stat_data(
                ['year'], geo, session,
                table_universe='Average mean score in both language and mathematics',
                percent=False)

            youth_average_language_score_by_year, _ = get_stat_data(
                ['year'], geo, session,
                table_universe='Average score in language',
                percent=False)

            youth_average_maths_score_by_year, _ = get_stat_data(
                ['year'], geo, session,
                table_universe='Average score in mathematics',
                percent=False)

            youth_language_outcome_latest, _ = get_stat_data(
                ['year', 'outcome'], geo, session,
                table_universe='Percentage passed in language',
                key_order={'outcome': ['Passed', 'Failed']},
                percent=False, slices=['2017'])

            youth_maths_outcome_latest, _ = get_stat_data(
                ['year', 'outcome'], geo, session,
                table_universe='Percentage passed in mathematics',
                key_order={'outcome': ['Passed', 'Failed']},
                percent=False, slices=['2017'])

        with dataset_context(year='2017'):
            youth_matric_outcome_by_year, _ = get_stat_data(
                ['year'], geo, session,
                table_universe='Matric pass rate',
                only={'outcome': ['Passed']},
                percent=False)

            youth_matric_outcome_latest, _ = get_stat_data(
                ['year', 'outcome'], geo, session,
                table_universe='Matric pass rate',
                key_order={'outcome': ['Passed', 'Failed']},
                percent=False, slices=['2017'])

            youth_matric_throughput_rate_by_year, _ = get_stat_data(
                ['year'], geo, session,
                table_universe='Matric passes as a % of grade 8 enrolment',
                only={'outcome': ['Passed']},
                percent=False)

            youth_matric_throughput_latest, _ = get_stat_data(
                ['year', 'outcome'], geo, session,
                table_universe='Matric passes as a % of grade 8 enrolment',
                key_order={'outcome': ['Passed', 'Dropped out or failed']},
                percent=False, slices=['2017'])

            youth_bachelor_passes_by_year, _ = get_stat_data(
                ['year'], geo, session,
                table_universe='Bachelor passes as a % of grade 8 enrolment',
                only={'outcome': ['Bachelor pass']},
                percent=False)

            youth_bachelor_outcome_latest, _ = get_stat_data(
                ['year', 'outcome'], geo, session,
                table_universe='Bachelor passes as a % of grade 8 enrolment',
                key_order={'outcome': ['Bachelor pass', 'No bachelor pass']},
                percent=False, slices=['2017'])

            youth_student_dropout_rate_by_year, _ = get_stat_data(
                ['year'], geo, session,
                table_universe='Dropout rates between grade 10 and matric',
                only={'outcome': ['Dropped out']},
                percent=False)

            youth_student_dropout_rate_latest, _ = get_stat_data(
                ['year', 'outcome'], geo, session,
                table_universe='Dropout rates between grade 10 and matric',
                percent=False, slices=['2017'])

        final_data.update({
            'youth_ave_mean_score_latest': {
                "name": "Average mean score in both language and mathematics",
                "values": {"this": youth_average_mean_score_by_year['2017']['values']['this']}
            },
            'youth_ave_mean_score_by_year': youth_average_mean_score_by_year,
            'youth_ave_language_score_latest': {
                "name": "Average score in language",
                "values": {"this": youth_average_language_score_by_year['2017']['values']['this']}
            },
            'youth_ave_language_score_by_year': youth_average_language_score_by_year,
            'youth_ave_maths_score_latest': {
                "name": "Average score in mathematics",
                "values": {"this": youth_average_maths_score_by_year['2017']['values']['this']}
            },
            'youth_ave_maths_score_by_year': youth_average_maths_score_by_year,
            'youth_language_outcome_latest': youth_language_outcome_latest,
            'youth_maths_outcome_latest': youth_maths_outcome_latest,
            'youth_matric_pass_rate_latest': {
                "name": "Of students writing matric passed",
                "values": {"this": youth_matric_outcome_latest['Passed']['values']['this']}
            },
            'youth_matric_outcome_latest': youth_matric_outcome_latest,
            'youth_matric_outcome_by_year': youth_matric_outcome_by_year,
            'youth_matric_throughput_rate_latest': {
                "name": "Of Grade 8 students go on to pass matric",
                "values": {"this": youth_matric_throughput_latest['Passed']['values']['this']}
            },
            'youth_matric_throughput_latest': youth_matric_throughput_latest,
            'youth_matric_throughput_rate_by_year': youth_matric_throughput_rate_by_year,
            'youth_bachelor_passes_latest': {
                "name": "Of Grade 8 students go on to pass matric with a bachelor's pass",
                "values": {"this": youth_bachelor_outcome_latest['Bachelor pass']['values']['this']}
            },
            'youth_bachelor_outcome_latest': youth_bachelor_outcome_latest,
            'youth_bachelor_passes_by_year': youth_bachelor_passes_by_year,
            'youth_student_dropout_rate_latest': {
                "name": "Of students drop out between grade 10 and matric",
                "values": {"this": youth_student_dropout_rate_latest['Dropped out']['values']['this']}
            },
            'youth_student_dropout_rate_by_year': youth_student_dropout_rate_by_year
        })

    return final_data


def get_economic_opportunities_profile(geo, session, display_profile, comparative=False):
    youth_labour_force_official, _ = get_stat_data(
        ['employment status'], geo, session,
        table_universe='Youth in the labour force - Official definition',
        table_dataset='Census and Community Survey')

    youth_labour_force_expanded, _ = get_stat_data(
        ['employment status'], geo, session,
        table_universe='Youth in the labour force - Expanded definition',
        table_dataset='Census and Community Survey')

    youth_unemployment_by_definition = OrderedDict((
        ('Official', {
            "name": "Official definition",
            "values": {"this": youth_labour_force_official['Unemployed']['values']['this']},
            "numerators": {"this": youth_labour_force_official['Unemployed']['numerators']['this']}
        }),
        ('Expanded', {
            "name": "Expanded definition",
            "values": {"this": youth_labour_force_expanded['Unemployed']['values']['this']},
            "numerators":{"this": youth_labour_force_expanded['Unemployed']['numerators']['this']}
        })
    ))
    youth_unemployment_by_definition['metadata'] = youth_labour_force_official['metadata']

    youth_official_unemployment_by_gender, _ = get_stat_data(
        ['employment status', 'gender'], geo, session,
        table_universe='Youth in the labour force - Official definition',
        table_dataset='Census and Community Survey',
        percent_grouping=['gender'], slices=['Unemployed'],
        key_order={'gender': GENDER_ORDER})

    youth_employment_status, _ = get_stat_data(
        ['employment status'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        key_order=EMPLOYMENT_STATUS_KEY_ORDER)

    pop_employment_status, _ = get_stat_data(
        ['employment status'], geo, session,
        table_universe='Population',
        table_dataset='Census and Community Survey',
        key_order=EMPLOYMENT_STATUS_KEY_ORDER)

    youth_employment_sector, _ = get_stat_data(
        ['employment sector'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        key_order=EMPLOYMENT_SECTOR_KEY_ORDER)

    pop_employment_sector, _ = get_stat_data(
        ['employment sector'], geo, session,
        table_universe='Population',
        table_dataset='Census and Community Survey',
        key_order=EMPLOYMENT_SECTOR_KEY_ORDER)

    youth_emp_edu_train_status, _ = get_stat_data(
        ['employment education training'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        key_order=EMP_EDU_TRAIN_KEY_ORDER)

    youth_neet_by_gender, _ = get_stat_data(
        ['employment education training', 'gender'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        percent_grouping=['gender'], slices=['NEET'],
        key_order={'gender': GENDER_ORDER})

    youth_household_employment, _ = get_stat_data(
        ['household employment'], geo, session,
        table_universe='Youth living in households',
        table_dataset='Census and Community Survey',
        key_order=HH_EMPLOYMENT_KEY_ORDER)

    final_data = {
        'youth_official_unemployment': {
            "name": "Youth (aged 15-24) unemployment rate using the official definition *",
            "values": {"this": youth_labour_force_official['Unemployed']['values']['this'],
            }
        },
        'youth_unemployment_by_definition': youth_unemployment_by_definition,
        'youth_official_unemployment_by_gender': youth_official_unemployment_by_gender,
        'youth_employed': {
            "name": "Of youth are employed",
            "values": {"this": youth_employment_status['Employed']['values']['this'],
            }
        },
        'youth_employment_status': youth_employment_status,
        'pop_employment_status': pop_employment_status,
        'youth_formal_sector': {
            "name": "Youth in the formal sector",
            "values": {"this": youth_employment_sector['Formal sector']['values']['this'],
            }
        },
        'youth_employment_sector': youth_employment_sector,
        'pop_employment_sector': pop_employment_sector,
        'youth_neet': {
            "name": "Of youth are not in employment, education or training (NEET)",
            "values": {"this": youth_emp_edu_train_status['NEET']['values']['this']
            }
        },
        'youth_emp_edu_train_status': youth_emp_edu_train_status,
        'youth_neet_by_gender': youth_neet_by_gender,
        'youth_no_working_adults': {
            "name": "Of youth live in households without an employed adult",
            "values": {"this": youth_household_employment['No employed adult']['values']['this']}
        },
        'youth_household_employment': youth_household_employment
    }

    return final_data


def get_living_environment_profile(geo, session, display_profile, comparative=False):
    final_data = {}

    youth_electricity_access, _ = get_stat_data(
        ['electricity access'], geo, session,
        table_universe='Youth living in households',
        table_dataset='Census and Community Survey',
        key_order=ELECTRICITY_ACCESS_KEY_ORDER)

    youth_toilet_access, _ = get_stat_data(
        ['toilet access'], geo, session,
        table_universe='Youth living in households',
        table_dataset='Census and Community Survey',
        key_order=TOILET_ACCESS_KEY_ORDER)

    youth_water_access, _ = get_stat_data(
        ['water access'], geo, session,
        table_universe='Youth living in households',
        table_dataset='Census and Community Survey',
        key_order=WATER_ACCESS_KEY_ORDER)

    youth_type_of_dwelling, _ = get_stat_data(
        ['type of dwelling'], geo, session,
        table_universe='Youth living in households',
        table_dataset='Census and Community Survey',
        key_order=TYPE_OF_DWELLING_ORDER)

    informal_not_in_backyard = youth_type_of_dwelling.get('Informal not in backyard', {}).get('values', {}).get('this', None)
    informal_in_backyard = youth_type_of_dwelling.get('Informal in backyard', {}).get('values', {}).get('this', None)

    youth_dwelling_informal = None
    if informal_not_in_backyard or informal_in_backyard:
        youth_dwelling_informal = (informal_not_in_backyard or 0) + (informal_in_backyard or 0)

    type_of_area_order = (TYPE_OF_AREA_ORDER_2016
        if current_context().get('year') == 'latest'
        else TYPE_OF_AREA_ORDER)

    youth_type_of_area, _ = get_stat_data(
        ['type of area'], geo, session,
        table_universe='Youth living in households',
        table_dataset='Census and Community Survey',
        key_order=type_of_area_order)

    youth_household_crowded, _ = get_stat_data(
        ['household crowded'], geo, session,
        table_universe='Youth living in households',
        table_dataset='Census and Community Survey',
        key_order=HH_CROWDED_KEY_ORDER)

    if str(current_context().get('year')) == '2011':
        # The releases have different indicators for internet access
        youth_access_to_internet, _ = get_stat_data(
            ['access to internet'], geo, session,
            table_universe='Youth living in households',
            table_dataset='Census and Community Survey',
            table_name='youth_access_to_internet_gender',
            key_order=INTERNET_ACCESS_ORDER)

        final_data.update({
            'youth_no_access_to_internet': {
                "name": "Of youth live in households with no access to internet",
                "values": {"this": youth_access_to_internet['No access to internet']['values']['this']}
            }
        })

    else:
        youth_access_to_internet, _ = get_stat_data(
            ['access to internet'], geo, session,
            table_universe='Youth living in households',
            table_dataset='Census and Community Survey',
            order_by='-total')

        final_data.update({
            'youth_cell_phone_access_internet': {
                "name": "Of youth access the internet through a cell phone",
                "values": {"this": youth_access_to_internet['Cell phone']['values']['this']}
            }
        })

    youth_by_living_with_parents_status, _ = get_stat_data(
        ['living with parents'], geo, session,
        table_universe='Youth aged 15-19 living in households',
        table_dataset='Census and Community Survey',
        key_order=LIVING_WITH_PARENTS_KEY_ORDER)

    living_with_parent_keys = ('Both parents', 'Mother only', 'Father only')
    living_with_parents_stat = sum(
        v['values']['this'] or 0
        for k, v in youth_by_living_with_parents_status.items()
        if k in living_with_parent_keys)

    final_data.update({
        'youth_electricity_access': youth_electricity_access,
        'youth_toilet_access': youth_toilet_access,
        'youth_water_access': youth_water_access,
        'youth_dwelling_informal': {
            "name": "Of youth live in households that are informal dwellings (shacks)",
            "values": {"this": youth_dwelling_informal}
        },
        'youth_type_of_dwelling': youth_type_of_dwelling,
        'youth_type_of_area': youth_type_of_area,
        'youth_households_overcrowded': {
            "name": "Of youth live in households that are overcrowded *",
            "values": {"this": youth_household_crowded['Overcrowded']['values']['this']}
        },
        'youth_household_crowded': youth_household_crowded,
        'youth_access_to_internet': youth_access_to_internet,
        'youth_living_with_parents': {
            "name": "Of youth aged 15-19 live with at least one biological parent",
            "values": {"this": living_with_parents_stat}
        },
        'youth_by_living_with_parents_status': youth_by_living_with_parents_status
    })

    return final_data

def get_poverty_profile(geo, session, display_profile, comparative=False):
    youth_income_poor_by_age_group, _ = get_stat_data(
        ['income poverty', 'age group'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        percent_grouping=['age group'], slices=['Income-poor'],
        recode=INCOME_POVERTY_AGE_GROUP_RECODE)

    youth_income_poor_by_pop_group, _ = get_stat_data(
        ['income poverty', 'population group'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        table_name='youth_income_poverty_population_group_gender',
        percent_grouping=['population group'], slices=['Income-poor'],
        key_order={'population group': POPULATION_GROUP_ORDER})

    youth_income_poor_by_gender, _ = get_stat_data(
        ['income poverty', 'gender'], geo, session,
        table_universe='Youth',
        table_dataset='Census and Community Survey',
        percent_grouping=['gender'], slices=['Income-poor'],
        key_order={'gender': GENDER_ORDER})

    with dataset_context(year='2011'):
        youth_multid_poverty, _ = get_stat_data(
            ['multidimensionally poor'], geo, session,
            table_universe='Youth',
            table_dataset='Multidimensional poverty',
            key_order=('Multidimensionally poor', 'Non-poor'),)

        youth_multid_poor_by_pop_group, _ = get_stat_data(
            ['multidimensionally poor', 'population group'], geo, session,
            table_universe='Youth',
            table_dataset='Multidimensional poverty',
            table_name='youth_multidimensionally_poor_population_group_gender',
            percent_grouping=['population group'], slices=['Multidimensionally poor'],
            key_order={'population group': POPULATION_GROUP_ORDER})

        youth_multid_poor_by_gender, _ = get_stat_data(
            ['multidimensionally poor', 'gender'], geo, session,
            table_universe='Youth',
            table_dataset='Multidimensional poverty',
            percent_grouping=['gender'], slices=['Multidimensionally poor'],
            key_order={'gender': GENDER_ORDER})

        youth_mpi_table = get_datatable('youth_mpi_score')

        youth_mpi_score, _ = youth_mpi_table.get_stat_data(
            geo, percent=False)
        youth_mpi_score['youth_mpi_score']['name'] = 'Youth MPI score (0-1)*'

    final_data = {
        'youth_income_poor': {
            "name": "Of youth live in income-poor households *",
            "values": {"this": youth_income_poor_by_age_group['Youth (15-24)']['values']['this']}
        },
        'youth_income_poor_by_age_group': youth_income_poor_by_age_group,
        'youth_income_poor_by_pop_group': youth_income_poor_by_pop_group,
        'youth_income_poor_by_gender': youth_income_poor_by_gender,
        'youth_multid_poor': {
            "name": "Of youth are multidimensionally poor*",
            "values": {"this": youth_multid_poverty['Multidimensionally poor']['values']['this']}
        },
        'youth_multid_poor_by_pop_group': youth_multid_poor_by_pop_group,
        'youth_multid_poor_by_gender': youth_multid_poor_by_gender,
        'youth_multid_poverty': youth_multid_poverty,
        'youth_mpi_score_stat': youth_mpi_score['youth_mpi_score'],
        'youth_mpi_score': youth_mpi_score
    }

    return final_data

def get_safety_profile(geo, session, display_profile, comparative=False):

    def rate_per_10k_pop(value, population):
        if not value:
            return None
        return value / population * 10000

    final_data = {}

    if display_profile == 'WC':
        youth_pop_table = get_datatable('youth_population')
        youth, pop_total = youth_pop_table.get_stat_data(
            geo, total='total_pop', percent='False')

        with dataset_context(year='2015'):
            victims_by_age_group_per_10k_pop, total_victims_per_10k_pop = get_stat_data(
                ['age group'], geo, session,
                table_universe='Victims of crime per 10,000 population in age group',
                table_dataset='Police Crime Statistics 2006-2015',
                percent=False)
            accused_by_age_group_per_10k_pop, total_accused_per_10k_pop = get_stat_data(
                ['age group'], geo, session,
                table_universe='Accused of crime per 10,000 population in age group',
                table_dataset='Police Crime Statistics 2006-2015',
                percent=False)

            youth_victims_by_offence_per_10k_youth, _ = get_stat_data(
                ['type of offence'], geo, session,
                table_universe='Youth victims of crime, per 10,000 youth',
                table_dataset='Police Crime Statistics 2006-2015')
            youth_accused_by_offence_per_10k_youth, _ = get_stat_data(
                ['type of offence'], geo, session,
                table_universe='Youth accused of crimes, per 10,000 youth',
                table_dataset='Police Crime Statistics 2006-2015')

            youth_victims_by_pop_group_per_10k, _ = get_stat_data(
                ['population group'], geo, session,
                table_universe='Youth victims of crime, per 10,000 youth',
                table_dataset='Police Crime Statistics 2006-2015',
                percent=False)
            youth_accused_by_pop_group_per_10k, _ = get_stat_data(
                ['population group'], geo, session,
                table_universe='Youth accused of crimes, per 10,000 youth',
                table_dataset='Police Crime Statistics 2006-2015',
                percent=False)

            youth_victims_by_gender_per_10k, _ = get_stat_data(
                ['gender'], geo, session,
                table_universe='Youth victims of crime, per 10,000 youth',
                table_dataset='Police Crime Statistics 2006-2015',
                percent=False,
                key_order=GENDER_ORDER)
            youth_accused_by_gender_per_10k, _ = get_stat_data(
                ['gender'], geo, session,
                table_universe='Youth accused of crimes, per 10,000 youth',
                table_dataset='Police Crime Statistics 2006-2015',
                percent=False,
                key_order=GENDER_ORDER)

            youth_victims_by_year, _ = get_stat_data(
                ['year'], geo, session,
                table_universe='Youth victims of crime',
                table_dataset='Police Crime Statistics 2006-2015',
                percent=False)
            youth_accused_by_year, _ = get_stat_data(
                ['year'], geo, session,
                table_universe='Youth accused of crimes',
                table_dataset='Police Crime Statistics 2006-2015',
                percent=False)

            crimes_by_year, _ = get_stat_data(
                ['type of crime', 'year'], geo, session,
                table_universe='Crimes',
                table_dataset='Police Crime Statistics 2006-2015',
                percent=False)

        contact_crimes_by_year = crimes_by_year['Contact crime']
        contact_crimes_by_year['metadata'] = crimes_by_year['metadata']
        property_crimes_by_year = crimes_by_year['Property crime']
        property_crimes_by_year['metadata'] = crimes_by_year['metadata']

        contact_crimes_per_10k_pop = rate_per_10k_pop(contact_crimes_by_year['2014-15']['values']['this'], pop_total)
        property_crimes_per_10k_pop = rate_per_10k_pop(property_crimes_by_year['2014-15']['values']['this'], pop_total)

        final_data = {
            'youth_victims_per_10k_youth': {
                "name": "Youth victims of contact crime per 10,000 youth",
                "values": {"this": victims_by_age_group_per_10k_pop['15-24']['values']['this']}
            },
            'youth_accused_per_10k_youth': {
                "name": "Youth accused of contact crime per 10,000 youth",
                "values": {"this": accused_by_age_group_per_10k_pop['15-24']['values']['this']}
            },
            'victims_by_age_group_per_10k_pop': victims_by_age_group_per_10k_pop,
            'accused_by_age_group_per_10k_pop': accused_by_age_group_per_10k_pop,
            'youth_victims_by_offence_per_10k_youth': youth_victims_by_offence_per_10k_youth,
            'youth_accused_by_offence_per_10k_youth': youth_accused_by_offence_per_10k_youth,
            'youth_victims_by_pop_group_per_10k': youth_victims_by_pop_group_per_10k,
            'youth_accused_by_pop_group_per_10k': youth_accused_by_pop_group_per_10k,
            'youth_victims_by_gender_per_10k': youth_victims_by_gender_per_10k,
            'youth_accused_by_gender_per_10k': youth_accused_by_gender_per_10k,
            'youth_victims_by_year': youth_victims_by_year,
            'youth_accused_by_year': youth_accused_by_year,
            'contact_crimes_per_10k_pop': {
                "name": "Contact crimes per 10,000 population",
                "values": {"this": contact_crimes_per_10k_pop}
            },
            'property_crimes_per_10k_pop': {
                "name": "Property-related crime per 10,000 population",
                "values": {"this": property_crimes_per_10k_pop}
            },
            'contact_crimes_by_year': contact_crimes_by_year,
            'property_crimes_by_year': property_crimes_by_year
        }

    return final_data


def get_health_profile(geo, session, display_profile, comparative=False):
    youth_difficulty_by_function, _ = get_stat_data(
        ['function type'], geo, session,
        table_universe='Youth with non-missing responses to the general health and functioning questions',
        table_dataset='Census and Community Survey',
        key_order=DIFFICULTY_FUNCTIONING_KEY_ORDER)

    youth_female_given_birth, _ = get_stat_data(
        ['given birth'], geo, session,
        table_universe='Female youth',
        table_dataset='Census and Community Survey',
        key_order=GIVEN_BIRTH_KEY_ORDER)

    youth_female_given_birth['Unspecified']['name'] = 'Unspecified *'

    youth_female_given_birth_by_age_group, _ = get_stat_data(
        ['given birth', 'age in completed years'], geo, session,
        table_universe='Female youth',
        table_dataset='Census and Community Survey',
        percent_grouping=['age in completed years'], slices=['Given birth'],
        key_order={'given birth': GIVEN_BIRTH_KEY_ORDER},
        recode=GIVEN_BIRTH_AGE_GROUP_RECODE)

    final_data = {
        'youth_difficulty_seeing': {
            "name": "Of youth experience difficulty in seeing even when using eye glasses",
            "values": {"this": youth_difficulty_by_function['Seeing, even when using eye glasses']['values']['this']}
        },
        'youth_difficulty_by_function': youth_difficulty_by_function,
        'youth_female_have_given_birth': {
            "name": "Of females aged 15-24 have given birth to a child",
            "values": {"this": youth_female_given_birth['Given birth']['values']['this']}
        },
        'youth_female_given_birth': youth_female_given_birth,
        'youth_female_given_birth_by_age_group': youth_female_given_birth_by_age_group
    }

    if display_profile == 'WC' and geo.geo_level != 'ward':
        # We don't have data on ward level for the following
        with dataset_context(year='2017'):
            youth_pregnancy_rate_by_year, _ = get_stat_data(
                ['year'], geo, session,
                table_universe='Teenage pregnancy rate by year',
                table_dataset='Department of Health Administrative data',
                percent=False)

            youth_delivery_rate_by_year, _ = get_stat_data(
                ['year'], geo, session,
                table_universe='Teenage delivery rate by year',
                table_dataset='Department of Health Administrative data',
                percent=False)

            youth_female_causes_of_death, _ = get_stat_data(
                ['cause of death'], geo, session,
                table_universe='Female youth causes of death',
                table_dataset='Department of Health Administrative data',
                order_by='-total')
            youth_male_causes_of_death, _ = get_stat_data(
                ['cause of death'], geo, session,
                table_universe='Male youth causes of death',
                table_dataset='Department of Health Administrative data',
                order_by='-total')

        if not comparative:
            youth_female_top10_causes_of_death = OrderedDict()
            youth_male_top10_causes_of_death = OrderedDict()
            for key, value in youth_female_causes_of_death.items()[0:10]:
                youth_female_top10_causes_of_death[key] = value
            for key, value in youth_male_causes_of_death.items()[0:10]:
                youth_male_top10_causes_of_death[key] = value

            youth_female_top10_causes_of_death['metadata'] = youth_female_causes_of_death['metadata']
            youth_male_top10_causes_of_death['metadata'] = youth_male_causes_of_death['metadata']

        final_data.update({
            'youth_preganacy_rate_latest': {
                "name": "Of total pregnancies are to females under 18 years",
                "values": {"this":youth_pregnancy_rate_by_year['2016-17']['values']['this']}
            },
            'youth_pregnancy_rate_by_year': youth_pregnancy_rate_by_year,
            'youth_delivery_rate_latest': {
                "name": "Of total deliveries are to females under 18 years",
                "values": {"this":youth_delivery_rate_by_year['2016-17']['values']['this']}
            },
            'youth_delivery_rate_by_year': youth_delivery_rate_by_year,
            'youth_female_HIV_deaths': {
                "name": "Of female youth deaths were due to HIV/AIDS",
                "values": {"this":youth_female_causes_of_death['HIV/AIDS']['values']['this']}
            },
            'youth_male_interpersonal_violence_deaths': {
                "name": "Of male youth deaths were due to interpersonal violence",
                "values": {"this":youth_male_causes_of_death['Interpersonal violence']['values']['this']}
            },
            'youth_female_top10_causes_of_death': youth_female_top10_causes_of_death if not comparative else youth_female_causes_of_death,
            'youth_male_top10_causes_of_death': youth_male_top10_causes_of_death if not comparative else youth_male_causes_of_death
        })

    return final_data
