CC = gcc
CFLAGS = -O2
LDFLAGS = -lncursesw -ltinfo
SRC = cfm.c
BIN = cfm
PREFIX = /usr/local/bin
H_PATH = $(HOME)/Документы/.h/
all: $(BIN)

$(BIN): $(SRC)
	$(CC) $(CFLAGS) -o $(BIN) $(SRC) $(LDFLAGS)

clean:
	rm -f $(BIN)

install:
	mkdir -p "$(H_PATH)"
	sudo install -m 755 $(BIN) $(PREFIX)
	cp help.1 "$(H_PATH)"

uninstall:
	sudo rm -f $(PREFIX)/$(BIN)
	rm -"$(H_PATH)help.1"

help:
	@echo "  make        - Собрать $(BIN)"
	@echo "  make clean  - Удалить скомпилированный файл"
	@echo "  make install    - Установить в $(PREFIX)"
	@echo "  make uninstall  - Удалить из $(PREFIX)"
	@echo "  make help   - Показать это сообщение"
#ладно
