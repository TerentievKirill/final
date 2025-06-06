# Используем официальный образ Go 1.23
FROM golang:1.23

# Создаём рабочую директорию
WORKDIR /app

# Копируем go.mod и go.sum отдельно для кеширования зависимостей
COPY go.mod go.sum ./
RUN go mod download

# Копируем всё остальное
COPY . .

# Собираем приложение
RUN go build -o tracker main.go parcel.go

# Устанавливаем команду по умолчанию
CMD ["./tracker"]
