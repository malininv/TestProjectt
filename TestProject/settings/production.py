from TestProject.settings.common import *
import os

DEBUG = False

SECRET_KEY = os.environ['SECRET_KEY']

ALLOWED_HOSTS = ['0.0.0.0', 'localhost', '127.0.0.1']
