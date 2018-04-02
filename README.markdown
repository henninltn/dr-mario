# Dr-Mario

Puzzle game like Dr.MARIO

## Requirement

- Roswell

## Usage

### run with launch script

```sh
./bootstrap.ros
```

### run with executable

```sh
ros build bootstrap.ros

./bootstrap
```

## Installation

### confirm quicklisp home

```
CL-USER> ql:*quicklisp-home*
```

### build and install

clone into quicklisp home

```sh
git clone https://github.com/henninltn/dr-mario.git /path/to/quicklisp/home/local-projects/dr-mario
```

and then, register local project with quickload

```
CL-USER> (ql:register-local-projects)
```

finally, build and install

```sh
cd /path/to/quicklisp/home/local-projects/dr-mario

ros build bootstrap.ros

# copy/move the created executable into PATH dir
sudo cp bootstrap /usr/bin/ # Linux
```

## Author

* hennin (hennin.ltn@gmail.com)

## Copyright

Copyright (c) 2018 hennin (hennin.ltn@gmail.com)

## License

Licensed under the MIT License.
