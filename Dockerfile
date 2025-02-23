FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app
COPY requirements.txt /app/
RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    && pip install gunicorn  # Explicit gunicorn install

COPY . /app/

EXPOSE 8000
CMD ["gunicorn", "dataloader.wsgi:application", "--bind", "0.0.0.0:8000"]
