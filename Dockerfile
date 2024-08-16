FROM python:3.13-rc-slim

# Set the working directory
WORKDIR /app


ARG IMAGE_NAME
RUN echo "IMAGE_NAME=${IMAGE_NAME}"

RUN str1='export PS1="\e[1;34m' && str2='@\w> \e[m"' && echo "$str1${IMAGE_NAME##*/}$str2" >> ~/.bashrc

CMD ["python", "--version"]
