# pull in the default wazimap settings
from wazimap.settings import *  # noqa

# install this app before Wazimap
INSTALLED_APPS = ['wazimap_za.apps.WazimapConfig', 'wazimap_mapit'] + INSTALLED_APPS

DATABASE_URL = os.environ.get('DATABASE_URL', 'postgresql://wazimap_za:wazimap_za@localhost/wazimap_za')
DATABASES['default'] = dj_database_url.parse(DATABASE_URL)
DATABASES['default']['ATOMIC_REQUESTS'] = True


# Localise this instance of Wazimap
WAZIMAP['name'] = 'Wazimap South Africa'
WAZIMAP['url'] = 'https://wazimap.co.za'
WAZIMAP['country_code'] = 'ZA'
WAZIMAP['comparative_levels'] = ['district', 'province', 'country']
# this is provided by mapit
WAZIMAP['geodata'] = 'wazimap_mapit.geo.GeoData'
WAZIMAP['geometry_data'] = {}

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

if wazi_profile == 'census':
    WAZIMAP['ga_tracking_id'] = 'UA-48399585-5'

elif wazi_profile == 'ecd':
    WAZIMAP['url'] = 'https://wazimap-ecd.code4sa.org'
    WAZIMAP['na_label'] = 'No Data'
    WAZIMAP['ga_tracking_id'] = 'UA-48399585-32'
    WAZIMAP['name'] = 'Wazimap ECD'

elif wazi_profile == 'youth':
    WAZIMAP['comparative_levels'] = ['district', 'province']
    WAZIMAP['levels'] = {
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
    WAZIMAP['url'] = 'https://wazimap-youth.code4sa.org'
    WAZIMAP['name'] = 'Western Cape Youth Explorer'


LANGUAGE_CODE = 'en-za'
USE_THOUSAND_SEPARATOR = True
FORMAT_MODULE_PATH = 'wazimap_za.formats'

LOGGING['loggers']['wazimap_za'] = {'level': 'DEBUG' if DEBUG else 'INFO'}
