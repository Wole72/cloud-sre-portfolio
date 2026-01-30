FROM python:3.12-slim

WORKDIR /app

# Prevents Python from writing .pyc files and ensures logs flush
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY main.py .

EXPOSE 8080

# Uvicorn is a common production-ish choice for FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]

