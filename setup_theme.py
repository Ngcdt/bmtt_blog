import urllib.request
import zipfile
import os
import shutil
import sys

def setup_theme():
    # 1. Create themes dir
    if not os.path.exists('themes'):
        os.makedirs('themes')

    # 2. Download
    url = 'https://github.com/theNewDynamic/gohugo-theme-ananke/archive/master.zip'
    zip_path = 'theme.zip'
    print(f"Downloading {url}...")
    try:
        urllib.request.urlretrieve(url, zip_path)
    except Exception as e:
        print(f"Download failed: {e}")
        return

    # 3. Extract
    print("Extracting...")
    try:
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall('themes')
    except Exception as e:
        print(f"Extraction failed: {e}")
        if os.path.exists(zip_path): os.remove(zip_path)
        return

    # 4. Rename
    target_dir = os.path.join('themes', 'ananke')
    if os.path.exists(target_dir):
        try:
            shutil.rmtree(target_dir)
        except Exception as e:
            print(f"Could not remove existing theme dir: {e}")
    
    # Locate extracted folder
    search_dir = 'themes'
    found = None
    for item in os.listdir(search_dir):
        if item.startswith('gohugo-theme-ananke'):
            found = os.path.join(search_dir, item)
            break
    
    if found:
        print(f"Renaming {found} to {target_dir}")
        try:
            shutil.move(found, target_dir)
        except Exception as e:
             # If move fails (e.g. target exists and rmtree failed), try rename
             print(f"Move failed: {e}")
    else:
        print("Could not find extracted theme folder.")

    # 5. Cleanup
    if os.path.exists(zip_path):
        os.remove(zip_path)
        
    # 6. Remove config.toml if exists
    if os.path.exists('config.toml'):
        print("Removing config.toml")
        try:
            os.remove('config.toml')
        except:
             pass
        
    print("Theme setup complete.")

if __name__ == "__main__":
    setup_theme()
