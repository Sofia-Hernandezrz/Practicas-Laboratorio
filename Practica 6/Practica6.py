from bs4 import BeautifulSoup
import requests

url = input("Ingresa la pagina a extraer los urls: ")
req = requests.get("http://" +url)
info = req.text
soup = BeautifulSoup(info, 'html.parser')
print(soup.find_all('a'))

for link in soup.find_all('a'):
    if link is not None:
        print(link.get('href'))
