FROM python:3.11  
 
WORKDIR /code  
 
COPY ./requirements.txt /code  

# Install dependencies
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt  
  
# Run as a non-privileged user
RUN useradd -ms /bin/sh -u 1001 app
USER app

# Copy source code over
COPY --chown=app:app ./app /code/app  

# Run the application
CMD ["python", "-u", "-m", "app.main"]
