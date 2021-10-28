import os

if __name__ == '__main__':
    static_ip = "http://35.227.16.143"
    dic = {'1': ':9870', '2': ':8081', '3': ":8888", '4': ':9000'}
    s = 'Welcome to Big Data Processing Application\n' + \
        'Please type the number that corresponds to which application you woule like to run:\n' + \
        '1. Apache Hadoop\n2. Apache Spark\n3. Jupyter Notebook\n4. SonarQube and SonarScanner\n\n' + \
        'Type the number here (type "q" to quit)>'
    which = ''
    while True:
        which = input(s)
        if which == 'q': break
        print()
        print(static_ip + dic[which])
        print()
        print()

