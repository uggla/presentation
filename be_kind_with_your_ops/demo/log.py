#!/usr/bin/env python3
import logging
import json
import pprint
import sys

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
logging.basicConfig(format="%(asctime)s - %(levelname)s - %(message)s")


def load_config(file_name="conf.json"):

    try:
        with open(file_name) as json_data:
            config = json.load(json_data)
            logger.info("Config read from file %s" % file_name)
            return config
    except FileNotFoundError as e:
        logger.error(e)
        sys.exit(1)


def main():
    config = load_config()
    pprint.pprint(config)


if __name__ == "__main__":
    main()
