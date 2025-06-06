# Используем Go 1.23 (последняя доступная минорная версия)
FROM golang:1.23

WORKDIR /app

# Копируем зависимости и скачиваем их
COPY go.mod go.sum ./
RUN go mod download

# Копируем оставшийся код
COPY . .

# Собираем бинарник
RUN go build -o tracker main.go parcel.go

# Запускаем бинарник
CMD ["./tracker"]
