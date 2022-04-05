import sys
import os

episode = sys.argv[1]
title = sys.argv[2]
process = os.popen('curl -s https://animekisa.tv/'+ title +'-episode-'+ episode +' | grep "var VidStreaming" | cut -c 59- | rev | cut -c3- | rev').read().strip()
for x in process:
  if x == 'M':
    break
  process = process[1:]
process = 'https://gogoplay4.com/download?id=' + process
print(process)


