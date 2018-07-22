import os

import plotly.offline as offline
from selenium import webdriver


def lambda_handler(event, context):
    print(f"cwd: {os.getcwd()}")
    offline.plot(figure_or_data={
        'data': [{'y': [4, 2, 3, 4]}],
        'layout': {'title': 'Test Plot',
                   'font': dict(size=12)}},
        image='png',
        auto_open=False,
        image_width=1000, image_height=500)

    driver = webdriver.PhantomJS(executable_path="bin/phantomjs")
    driver.set_window_size(1000, 500)
    driver.get('temp-plot.html')
    driver.save_screenshot('output/my_plot.png')
