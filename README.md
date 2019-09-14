# docker-php56-composer

Legacy docker image with php5.6 and composer custom versión

## How to use it?

To use this docker image you must add the volume the code you want or a volume with the necessary configuration to composer.

```bash
    docker run --rm -it -v $CODEVOLUM:$CODEPATH docker-php56-composer  composer install $CODEPATH
```

Other options is to use it in a docker-composer

```bash
    composer:
        image: docker-php5.6-composer
        volumes:
            - $CODEVOLUM:$CODEPATH
        command: ['/bin/sh', '-c', 'composer install $CODEPATH']
```

If you need to use this tool in a kubernetes project, it is possible to use it as an initcontainer as composer is usually a task that is performed before executing the code container.

```bash
        initContainer:
            - image: docker-php5.6-composer
              name: composer-legacy
              command: ['/bin/sh', '-c', 'composer install $CODEPATH']
              volumes:
```

## How to change the version of composer?

To change the version of compose it is necessary to modify the variable with the desired version " COMPOSER_VERSION " of composer into Dockerfile.
