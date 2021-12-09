Создаем:

```docker build -f Dockerfile -t tor/bridge .```

Запускаем:

```docker run -d -p 35671:35671 tor/bridge home/start.sh```

https://t.me/h07_ru