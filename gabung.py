import os

# lokasi folder proyek (gunakan r"..." supaya backslash aman)
base_folder = r"C:\xampp\htdocs\teste"
output_file = "gabungan_proyek.txt"

with open(output_file, "w", encoding="utf-8") as outfile:
    for root, _, files in os.walk(base_folder):
        for file in files:
            if file.endswith((".html", ".css", ".js", ".txt", ".md", ".php")):  # tambahkan .php
                filepath = os.path.join(root, file)
                outfile.write(f"\n\n===== {filepath} =====\n\n")
                try:
                    with open(filepath, "r", encoding="utf-8") as infile:
                        outfile.write(infile.read())
                except Exception as e:
                    outfile.write(f"[Gagal membaca file ini: {e}]\n")

print(f"Selesai! Semua file digabung ke {output_file}")
