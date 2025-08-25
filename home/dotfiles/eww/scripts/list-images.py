import os
import json

user = os.environ["USER"]
arr = []
dir_path = f"/home/{user}/Pictures/Wallpapers/"  

image_extensions = (".png", ".jpg", ".jpeg", ".gif")
for file in os.listdir(dir_path):
    if file.lower().endswith(image_extensions):
        arr.append(os.path.join(dir_path, file))

print(json.dumps(arr))

