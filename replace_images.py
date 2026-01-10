"""
DOCX Image Replacement Script
Replaces infograph images in the original DOCX with newly generated PNGs.

Based on analysis of the DOCX structure:
- image1.png, image2.png = Figura 1 (curto prazo) + placeholder
- image3.png, image4.png = Figura 2 (médio prazo) + placeholder
- etc.

The pattern follows: odd images are the originals, even are placeholders to be replaced.
But we need to replace BOTH with our new image.

Usage:
    python replace_images.py
"""

import os
import shutil
import zipfile
import tempfile

# Paths
ORIGINAL_DOCX = r"docFile\Final - 09.01.2025_PRODUTO 3.docx"
OUTPUT_DOCX = r"outputs\Final_Updated.docx"

# Image mapping based on docx_content.md analysis:
# Figuras 1-9: Eixos (curto, medio, longo x 3)
# Figuras 10-23: Maps and Regions alternating
# Each Figure has the original + a "PARA FAZER" placeholder after it

# From docx_content.md:
# Figura 1 = image1 (line 213), placeholder = image2 (line 217)
# Figura 2 = image3 (line 233), placeholder = image4 (line 239)  
# Figura 3 = image5 (line 253), placeholder = image6 (line 257)
# Figura 4 = image7 (line 333), placeholder = image8 (line 339)
# Figura 5 = image9 (line 351), placeholder = image10 (line 355)
# Figura 6 = image11 (line 367) - no placeholder noted
# Figura 7 = image12 (line 455), placeholder = image13 (line 459)
# Figura 8 = image14 (line 469) - no placeholder
# Figura 9 = image15 (line 483), placeholder = image16 (line 487)
# Figura 10 = image17 (map - keep)
# Figura 11 = image18 (line 563), placeholder = image19 (line 567)
# Figura 12 = image20 (map - keep)  
# Figura 13 = image21 (line 593), placeholder = image22 (line 597)
# Figura 14 = image23 (map - keep)
# Figura 15 = image24 (line 621), placeholder = image25 (line 627)
# Figura 16 = image26 (map - keep)
# Figura 17 = image27 (line 651), placeholder = image28 (line 655)
# Figura 18 = image29 (map - keep)
# Figura 19 = image30 (line 675), placeholder = image31 (line 679)
# Figura 20 = image32 (map - keep)
# Figura 21 = image33 (line 697), placeholder = image34 (line 701)
# Figura 22 = image35 (map - keep)
# Figura 23 = image36 (line 721), placeholder = image37 (line 725)

IMAGE_MAPPING = {
    # Eixo 1 - Teal
    "image1.png": "outputs/eixo01/curto-prazo/output.png",    # Figura 1
    "image2.png": "outputs/eixo01/curto-prazo/output.png",    # Placeholder
    "image3.png": "outputs/eixo01/medio-prazo/output.png",    # Figura 2
    "image4.png": "outputs/eixo01/medio-prazo/output.png",    # Placeholder
    "image5.png": "outputs/eixo01/longo-prazo/output.png",    # Figura 3
    "image6.png": "outputs/eixo01/longo-prazo/output.png",    # Placeholder
    
    # Eixo 2 - Purple
    "image7.jpeg": "outputs/eixo02/curto-prazo/output.png",   # Figura 4
    "image8.png": "outputs/eixo02/curto-prazo/output.png",    # Placeholder
    "image9.png": "outputs/eixo02/medio-prazo/output.png",    # Figura 5
    "image10.png": "outputs/eixo02/medio-prazo/output.png",   # Placeholder
    "image11.png": "outputs/eixo02/longo-prazo/output.png",   # Figura 6
    
    # Eixo 3 - Orange
    "image12.png": "outputs/eixo03/curto-prazo/output.png",   # Figura 7
    "image13.png": "outputs/eixo03/curto-prazo/output.png",   # Placeholder
    "image14.png": "outputs/eixo03/medio-prazo/output.png",   # Figura 8
    "image15.png": "outputs/eixo03/longo-prazo/output.png",   # Figura 9
    "image16.png": "outputs/eixo03/longo-prazo/output.png",   # Placeholder
    
    # Maps are kept (image17, image20, image23, image26, image29, image32, image35)
    
    # Regiões - Red
    "image18.jpeg": "outputs/regioes/regiao01/output.png",    # Figura 11 - 1a Região
    "image19.png": "outputs/regioes/regiao01/output.png",     # Placeholder
    # image20 = map (keep)
    "image21.png": "outputs/regioes/regiao03/output.png",     # Figura 13 - 3a Região
    "image22.png": "outputs/regioes/regiao03/output.png",     # Placeholder
    # image23 = map (keep)
    "image24.png": "outputs/regioes/regiao04/output.png",     # Figura 15 - 4a Região
    "image25.png": "outputs/regioes/regiao04/output.png",     # Placeholder
    # image26 = map (keep)
    "image27.png": "outputs/regioes/regiao05/output.png",     # Figura 17 - 5a Região
    "image28.png": "outputs/regioes/regiao05/output.png",     # Placeholder
    # image29 = map (keep)
    "image30.png": "outputs/regioes/regiao06/output.png",     # Figura 19 - 6a Região
    "image31.png": "outputs/regioes/regiao06/output.png",     # Placeholder
    # image32 = map (keep)
    "image33.png": "outputs/regioes/regiao07/output.png",     # Figura 21 - 7a Região
    "image34.png": "outputs/regioes/regiao07/output.png",     # Placeholder
    # image35 = map (keep)
    "image36.png": "outputs/regioes/regiao08/output.png",     # Figura 23 - 8a Região
    "image37.png": "outputs/regioes/regiao08/output.png",     # Placeholder
}

def replace_images_in_docx():
    """Replace images in DOCX by modifying the underlying media files."""
    
    # Create temp directory
    temp_dir = tempfile.mkdtemp()
    
    try:
        # Copy DOCX to temp as ZIP
        temp_zip = os.path.join(temp_dir, "temp.zip")
        shutil.copy(ORIGINAL_DOCX, temp_zip)
        
        # Extract
        extract_dir = os.path.join(temp_dir, "extracted")
        with zipfile.ZipFile(temp_zip, 'r') as zip_ref:
            zip_ref.extractall(extract_dir)
        
        # Replace images in word/media folder
        media_dir = os.path.join(extract_dir, "word", "media")
        
        if not os.path.exists(media_dir):
            print("Error: No media folder found in DOCX")
            return
        
        replacements = 0
        for old_filename, new_path in IMAGE_MAPPING.items():
            old_path = os.path.join(media_dir, old_filename)
            
            if os.path.exists(old_path) and os.path.exists(new_path):
                # Remove old file
                os.remove(old_path)
                # Copy new PNG (keeping same filename for XML refs)
                shutil.copy(new_path, old_path)
                print(f"✓ Replaced: {old_filename} <- {os.path.basename(new_path)}")
                replacements += 1
            elif not os.path.exists(old_path):
                print(f"  Skip: {old_filename} (not in DOCX)")
            else:
                print(f"  Warning: {new_path} not found")
        
        print(f"\nTotal replacements: {replacements}")
        
        # Repack DOCX
        os.makedirs(os.path.dirname(OUTPUT_DOCX), exist_ok=True)
        
        with zipfile.ZipFile(OUTPUT_DOCX, 'w', zipfile.ZIP_DEFLATED) as zipf:
            for root, dirs, files in os.walk(extract_dir):
                for file in files:
                    file_path = os.path.join(root, file)
                    arcname = os.path.relpath(file_path, extract_dir)
                    zipf.write(file_path, arcname)
        
        print(f"\n✓ Output saved: {OUTPUT_DOCX}")
        
    finally:
        # Cleanup
        shutil.rmtree(temp_dir)

if __name__ == "__main__":
    print("=" * 50)
    print("DOCX Image Replacement Script")
    print("=" * 50)
    print(f"Input:  {ORIGINAL_DOCX}")
    print(f"Output: {OUTPUT_DOCX}")
    print()
    
    if not os.path.exists(ORIGINAL_DOCX):
        print(f"Error: Original DOCX not found: {ORIGINAL_DOCX}")
    else:
        replace_images_in_docx()
