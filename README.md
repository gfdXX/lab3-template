# РСОИ, ЛР3: отказоустойчивость микросервисов

![Python](https://img.shields.io/badge/Python-FastAPI-009688?logo=fastapi&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-SQLAlchemy-4169E1?logo=postgresql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-compose-2496ED?logo=docker&logoColor=white)

Лабораторная работа №3 по курсу «Распределённые системы обработки информации», МГТУ им. Н.Э. Баумана (осень 2025).
Условие задания — в [ASSIGNMENT.md](ASSIGNMENT.md).

## Что сделано

Сервис аренды автомобилей из [ЛР2](https://github.com/gfdXX/lab2-template) (Gateway, Cars, Rental, Payment) дополнен механизмами отказоустойчивости в Gateway ([`services/gateway_service/main.py`](services/gateway_service/main.py)):

- **Circuit Breaker** для каждого сервиса: состояния CLOSED → OPEN → HALF_OPEN, статистика сбоев в скользящем окне, после 3 ошибок запросы сразу получают fallback, через 30 секунд пробный запрос проверяет, ожил ли сервис;
- **деградация функциональности**: если недоступен вспомогательный сервис, Gateway отдаёт данные без его части; если недоступен обязательный — понятную ошибку `503 … unavailable`;
- **очередь повторов**: если при отмене аренды Payment недоступен, запрос на отмену оплаты кладётся в очередь и повторяется в фоновом потоке, пока не пройдёт;
- `GET /manage/health` на всех сервисах и служебные эндпоинты для тестов: принудительно открыть/закрыть breaker, посмотреть статистику.

## Запуск

```bash
git clone https://github.com/gfdXX/lab3-template.git
cd lab3-template
docker compose up --build        # Gateway на http://localhost:8080
```

## Автор

Салженикин Даниил, МГТУ им. Н.Э. Баумана.
