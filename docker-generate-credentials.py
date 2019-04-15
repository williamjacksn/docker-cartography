import configparser
import os
import pathlib

pathlib.Path('/root/.aws').mkdir(parents=True, exist_ok=True)

config = configparser.ConfigParser()
config['default'] = {'region': os.getenv('AWS_DEFAULT_REGION')}
config_file = pathlib.Path('/root/.aws/config')
config_file.touch()
with config_file.open('w') as f:
    config.write(f)

credentials = configparser.ConfigParser()
credentials['default'] = {
    'aws_access_key_id': os.getenv('AWS_ACCESS_KEY_ID'),
    'aws_secret_access_key': os.getenv('AWS_SECRET_ACCESS_KEY')
}
credentials_file = pathlib.Path('/root/.aws/credentials')
credentials_file.touch()
with credentials_file.open('w') as f:
    credentials.write(f)
