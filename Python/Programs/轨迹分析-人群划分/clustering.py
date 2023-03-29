import pandas as pd
import glob, os
import folium
import requests
from Tools import DBSCAN
from math import cos, sin, atan2, sqrt, radians, degrees

def center_geolocation(geolocations):
    """
    输入多个经纬度坐标，找出中心点
    :param geolocations: 集合
    :return:
    """
    x = 0
    y = 0
    z = 0
    length = len(geolocations)
    for lat, lon in geolocations:
        lon = radians(float(lon))
        lat = radians(float(lat))
        x += cos(lat) * cos(lon)
        y += cos(lat) * sin(lon)
        z += sin(lat)

    x = float(x / length)
    y = float(y / length)
    z = float(z / length)

    return (degrees(atan2(z, sqrt(x * x + y * y)))), degrees(atan2(y, x))

def georequest(vin, geolocations):
    # 接口请求地址
    url = "https://apis.map.qq.com/ws/geocoder/v1/"
    # 请求头
    headers = {
        "content-type": "application/json"
    }
    # 键值队
    payload = {
        "key": "FB4BZ-FA6L3-L4H3N-3LD53-FGZZO-YSBE3",
        "location": geolocations
    }
    # 构造发送请求
    response = requests.get(url=url, headers=headers, params=payload)
    # 打印响应数据
    f = open('Address/'+str(vin)+'.txt', 'a')
    f.writelines(response.text)
    f.close()

colors = {'wqmbpgahavumabeif':'green',
          'wqmbpgahavumabejj':'black',
          'wqmbpgahavumajdgb':'purple',
          'wqmbpgahavumajehd':'red',
          'wqmbpgahavumbageb':'lightred',
          'wqmbpgahavumbbcba':'beige',
          'wqmbpgahavumbdicj':'orange',
          'wqmbpgahavumbedfb':'gray',
          'wqmbpgahavumbfcec':'pink',
          'wqmbpgahavumbfefc':'blue'}

files = glob.glob("StayPoints/*.csv")
df = pd.concat([pd.read_csv(fp).assign(vin=os.path.basename(fp).split('.')[0]) for fp in files], ignore_index = True)

GPS = []
length = df.shape[0]
for i in range(length):
    GPS.append([df["latitude"][i], df["longitude"][i]])

map = folium.Map(location=GPS[0], zoom_start=15, attr='default', tiles='https://rt0.map.gtimg.com/tile?z={z}&x={x}&y={-y}')
result = DBSCAN(df, 0.03, 3)

midGPS = [[] for i in range(max(result)+1)]
index = [[] for i in range(max(result)+1)]
for j in range(length):
    if result[j] != -1:
        midGPS[result[j]].append(tuple(GPS[j]))
        index[result[j]].append(j)
for k in range(len(midGPS)):
    cengeo = center_geolocation(midGPS[k])
    georequest(df["vin"][index[k][0]], str(cengeo[0])+','+str(cengeo[1]))
    folium.Marker(
        location=cengeo,
        tooltip="vin = " + df["vin"][index[k][0]],
        icon=folium.Icon(color=colors[df["vin"][index[k][0]]])
    ).add_to(map)
map.save("Maps/停留点4.HTML")
