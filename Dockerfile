FROM python:3

WORKDIR /usr/src/app

RUN apt-get install -y git
RUN git clone https://github.com/limyewjin/email-assistant.git
RUN cd email-assistant && pip install --no-cache-dir -r requirements.txt
RUN cd email-assistant && mkdir .credentials

COPY .env /usr/src/app/email-assistant/.env
COPY credentials.json /usr/src/app/email-assistant/.credentials/credentials.json

COPY . .

CMD [ "python", "./email-assistant/code/main.py" ]