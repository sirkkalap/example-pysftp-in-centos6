import logging, pysftp
from datetime import datetime

logging.basicConfig(level=logging.INFO)

def main():
    logging.info("Connecting")
    with pysftp.Connection("sftp_server", \
        username="foo", \
        password="123") as sftp:

        logging.info("Change dir")
        with sftp.cd("share"):
            logging.info("List files")
            logging.info(sftp.listdir())
            logging.info("Put file")
            sftp.put("/example-app/example.py")
            logging.info("Rename file")
            nicedate = datetime.now().isoformat().replace(":", "-")
            sftp.rename("example.py", "{0}-example.py".format(nicedate))

    logging.info("Done")

if __name__ == "__main__":
    main()
