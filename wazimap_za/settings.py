import os

# pull in the default wazimap settings
from collections import OrderedDict
from wazimap.settings import *  # noqa

# install this app before Wazimap
INSTALLED_APPS = ['test_without_migrations', 'wazimap_za.apps.WazimapConfig'] + INSTALLED_APPS

# redirect www.wazimap.co.za to wazimap.co.za
STRIP_WWW = True


# Localise this instance of Wazimap
WAZIMAP['name'] = 'Wazimap'
WAZIMAP['url'] = 'https://wazimap.co.za'
WAZIMAP['country_code'] = 'ZA'
WAZIMAP['comparative_levels'] = ['district', 'province', 'country']
# this is provided by mapit
WAZIMAP['geodata'] = 'wazimap_za.geo.GeoData'
WAZIMAP['geometry_data'] = {}
# google maps api key
WAZIMAP['google_geocode_api_key'] = os.environ.get('GOOGLE_GEOCODE_API_KEY', '')

WAZIMAP['levels'] = {
    'country': {
        'plural': 'countries',
        'children': ['province', 'district', 'municipality'],
    },
    'province': {
        'children': ['district', 'municipality', 'ward'],
    },
    'district': {
        'children': ['municipality', 'ward'],
    },
    'municipality': {
        'plural': 'municipalities',
        'children': ['ward'],
    },
    'ward': {
        'children': [],
    }
}

wazi_profile = os.environ.get('WAZI_PROFILE', 'census')

WAZIMAP['default_profile'] = wazi_profile
WAZIMAP['profile_builder'] = 'wazimap_za.profiles.{}.get_profile'.format(wazi_profile)
WAZIMAP['default_geo_version'] = os.environ.get('DEFAULT_GEO_VERSION', None)
WAZIMAP['legacy_embed_geo_version'] = '2011'
WAZIMAP['primary_release_year'] = {
    # use the 2011 release for wards, use the latest (2016) for everything else
    'ward': 2011,
}
WAZIMAP['latest_release_year'] = '2016'
WAZIMAP['primary_dataset_name'] = 'Census and Community Survey'
WAZIMAP['available_release_years'] = {
    # Release years with data for geo_levels.
    # Only specify geo_levels with limited releases.
    # Other geo_levels have data for all releases.
    'ward': [2011]
}

if wazi_profile == 'census':
    DATABASE_URL = os.environ.get('DATABASE_URL', 'postgresql://wazimap_census:wazimap_census@localhost/wazimap_census')
    WAZIMAP['ga_tracking_id'] = 'G-9P9RRPEZFK'

    WAZIMAP['video_links'] = OrderedDict([
        ('intro', 'https://www.youtube.com/embed/lXKDBoRSqxo?list=PL7MJ_sFHs952CYcKHPQp786HVVy83nBwH'),
        ('table_view', 'https://www.youtube.com/embed/KQ8jM51S1Ik?list=PL7MJ_sFHs952CYcKHPQp786HVVy83nBwH'),
        ('map_view', 'https://www.youtube.com/embed/SFsTnYkTKx0?list=PL7MJ_sFHs952CYcKHPQp786HVVy83nBwH'),
        ('distribution_view', 'https://www.youtube.com/embed/WCftaPfULSg?list=PL7MJ_sFHs952CYcKHPQp786HVVy83nBwH'),
        ("comparing_places", 'https://www.youtube.com/embed/7mSZnXFHFxo?list=PL7MJ_sFHs952CYcKHPQp786HVVy83nBwH')
    ])

elif wazi_profile == 'youth':
    DATABASE_URL = os.environ.get('DATABASE_URL', 'postgresql://wazimap_youth:wazimap_youth@localhost/wazimap_youth')
    WAZIMAP['url'] = 'https://youthexplorer.org.za'
    WAZIMAP['name'] = 'Youth Explorer'
    WAZIMAP['ga_tracking_id'] = 'G-22426P1LMH'
    WAZIMAP['twitter'] = None

    WAZIMAP['video_links'] = OrderedDict([
        ('intro', 'https://www.youtube.com/embed/do5XexPJhDc?list=PL7MJ_sFHs952rlUTNpQr7-n9UwQWkBXyx',),
        ('table_view', 'https://www.youtube.com/embed/bynx320D5kY?list=PL7MJ_sFHs952rlUTNpQr7-n9UwQWkBXyx',),
        ('map_view', 'https://www.youtube.com/embed/IHVWdv-Yuos?list=PL7MJ_sFHs952rlUTNpQr7-n9UwQWkBXyx',),
        ('distribution_view', 'https://www.youtube.com/embed/jhzGFGSAJ9o?list=PL7MJ_sFHs952rlUTNpQr7-n9UwQWkBXyx',),
        ("comparing_places", 'https://www.youtube.com/embed/1I8RPPJ0g1c?list=PL7MJ_sFHs952rlUTNpQr7-n9UwQWkBXyx')
    ])

    WAZIMAP['mapit'] = {
        'generations': {
            '2011': '1',
            '2016': '2',
            None: '1',
        }
    }

DATABASES['default'] = dj_database_url.parse(DATABASE_URL)
DATABASES['default']['ATOMIC_REQUESTS'] = True
DATABASES['default']['TEST'] = {
    'NAME': 'test_wazimap_za',
}

LANGUAGE_CODE = 'en-za'
USE_THOUSAND_SEPARATOR = True
FORMAT_MODULE_PATH = 'wazimap_za.formats'

LOGGING['loggers']['wazimap_za'] = {'level': 'DEBUG' if DEBUG else 'INFO'}
