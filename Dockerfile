FROM python

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get update -y && \
    apt-get install -y xvfb google-chrome-stable && \
    export version=$(google-chrome --version | awk '{ print $3 }') && \
    wget -q --continue -P /chromedriver "https://storage.googleapis.com/chrome-for-testing-public/${version}/linux64/chromedriver-linux64.zip" && \
    unzip /chromedriver/chromedriver* -d /chromedriver && \
    chmod +x /chromedriver/chromedriver-linux64/chromedriver && \
    mv /chromedriver/chromedriver-linux64/chromedriver /usr/bin/chromedriver

COPY requirements.txt requirements.txt
RUN pip3 install --upgrade --no-cache-dir -r requirements.txt
RUN rm requirements.txt

