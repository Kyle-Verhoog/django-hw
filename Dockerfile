# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.9

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE app.settings

RUN git clone https://github.com/Kyle-Verhoog/django-hw.git /src
WORKDIR /src
RUN pip install -r requirements.txt
VOLUME /src
EXPOSE 8000
CMD python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000
