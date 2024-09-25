# Переменная LOCAL_BIN содержит путь к папке bin в текущем каталоге проекта.
LOCAL_BIN := $(CURDIR)/bin

# Цель install-golangci-lint устанавливает golangci-lint в папку, указанную в LOCAL_BIN.
# GOBIN - переменная окружения, указывающая на папку, куда будет установлен golangci-lint.
install-golangci-lint:
	GOBIN=$(LOCAL_BIN) go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.60.3

# Цель lint запускает golangci-lint для проверки кода.
# Здесь используется установленный ранее golangci-lint из папки LOCAL_BIN.
# Команда проверяет все Go файлы в проекте и применяет конфигурацию из файла .golangci.pipeline.yaml.
lint:
	$(LOCAL_BIN)/golangci-lint run ./... --config .golangci.pipeline.yaml

