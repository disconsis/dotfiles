NUM_ITER = 500

from time import time
import os

now = time()

for i in range(NUM_ITER):
    os.system('python3 $HOME/p9k_scripts/pltask.py 1 2 > /dev/null')

then = time()

print((then - now)/NUM_ITER, 'seconds per call')
