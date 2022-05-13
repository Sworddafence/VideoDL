import sys
import os

episode = sys.argv[1]
title = sys.argv[2]
process = os.popen('curl -s https://gogoanime.gg/'+ title +'-episode-'+ episode +' | grep "Vidstreaming"').read().strip()

for x in process:
  if x == 'M':
    break
  process = process[1:]
end = process.split("\"", 1)
process = end[0]
process = 'https://gogoplay4.com/download?id=' + process
print(process)
