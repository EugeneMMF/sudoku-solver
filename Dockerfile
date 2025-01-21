FROM archlinux/archlinux

ENV HOST_PORT=5000

WORKDIR /home/user/sudoku-solver

RUN pacman -Syu --noconfirm
RUN pacman -S python --noconfirm
RUN pacman -S tesseract-data-eng --noconfirm
RUN pacman -S glu --noconfirm
RUN pacman -S nano --noconfirm
RUN pacman -S python-pip --noconfirm

COPY . .

RUN python -m venv venv

RUN /home/user/sudoku-solver/venv/bin/pip install -r requirements.txt

RUN chmod +x ./script.sh

RUN mkdir uploads static

EXPOSE 5000

CMD ./script.sh