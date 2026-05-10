#!/bin/bash

# Prompt for chapter number
read -p "Enter chapter number (e.g., 01 for ch01.html): " CHAPTER_NUM
CHAPTER="ch${CHAPTER_NUM}.html"
PDF_OUTPUT="ch${CHAPTER_NUM}.pdf"

# Define variables for reuse
BASE_URL="https://learning.oreilly.com"
API_PATH="/api/v2/epubs/urn:orm:book:9780071835886/files/"
COOKIES='ak_bmsc=1850F47C73F6B621058124E53C428D13~000000000000000000000000000000~YAAQysgwF5sptuOYAQAAN7mtCBzh/nqjeaTP5U/glE0le7gG11T9fwFgo22zl0JsL54GnSijxL+F4z6D22PBFq8OVkgrDi7A/ZYAJ3bHqJxAnKohZvRmQk1zBHcRYW2JeZrD6bmOeFIlDkifE6FyT1+6gXZiQ+pBZX1a5OHtsN4J2ybmFRuQj+JX+VeHWSJY6fhUjpl9souDMNE9zgeax5nxEfUm4nqIqRx6GOpyIWgq5SVU9RUfv79QEXOgm1uJilwBn2AEzaWsoKwB1Rl2OD/qtJvhhlsZ7cR+MKTZEsirTncHUrZwPIxwovZNLZYkTOLFVfqIfiAbYBk0r8bCQNftEDf+ucDN1uz9CnjAt0WDTy7f7vAcXmIhdt83rxEvoEpB/PKSz2x2BYzueiusOYshkSjeCnHG7AYzCZXzU2G90iisnw==; _vwo_uuid_v2=D605686B9AD363F914253C07C086CE1BD|7c3619ed4a518f74980bfff904b8a221; _vis_opt_s=1%7C; _vis_opt_test_cookie=1; _vwo_uuid=D605686B9AD363F914253C07C086CE1BD; _vwo_ds=3%241756787227%3A87.875122%3A%3A; akaalb_LearningALB=~op=learning_oreilly_com_GCP_ALB:learning_oreilly_com_gcp1|~rv=8~m=learning_oreilly_com_gcp1:0|~os=3284f997983d0bd4e10a6b83f3b25a7c~id=865be7221ba48803070bb343ff88047f; orm-rt=25795f36cf4a42eca69e4f9e241b1219; groot_sessionid=gti9xtqloswzrefqk7rbuetp4jiml4no; _abck=076C7579BF026D63DF2C4B223C0C4F43~0~YAAQpYEyFw7mbfCYAQAAGoGvCA6vPijYy62J+neuz3PLIANImTWF1CfhpyfICpZDsY4h7Gccm56GeWH1vgDzxc8NMl8IOYGQMlYs10SBWskQxnRhIqO7yvPVQyU1IElZJZyvT514odqAH7AXNZDWwBNQZGZfteGBqVMgx2LLOlmZ6O5NKa8jgyfy9tQrdYP7cgavoqW3CN6Gkoz39wREJ8duP47adT6du8/sy4NG3XU5bZ7slJqX0XsVnA5QYEvWUGxliz85KjE7l3UI7KUkipWmI+jPvavKLF1nBRuvskRc/DdVoCYVNmlZ8UiXUwfMfkVyjkUgV9/+HEUKO+oufy81Qk/Fco7AI5xdhdIVL1LRSvj/bbpoy/CNIPo8aqkNtqphiWsr8qiKSG0wRWk/lOdwZJVoJeCZ2A8s81nj/kL4zJDtxZ/nEZoYHyDSoWKWRFsOlA8iToPgbdyjSeCzcihEw+6EE0L8NbAGHz9whgspIzcMcdyhaaQoxMv+PvgglJnLIuIyrPCMzd4T713PtKCnX6UAxtg+hgU+jo2DPKEFqs/lYLTyp0VkII1zV4Sqi0TDE3PYA34PMsJCcfKTx6vn0G7WuUcc3clAF0L0EN0HoAALkr5DACCltsgHWbA6/Sk=~-1~-1~-1~AAQAAAAE%2f%2f%2f%2f%2fyu54v83Ii1Y8GVoD8U3pzE7T4HXIHHw9mw%2f5csXurCrlEyK6%2fYS3fbX9QjMdAZzA2Zx3+m4yWipZ4QhIfEGtKDCh45YFKjsXhLw~-1; bm_sz=2B79724401FD14098B748B1903F72605~YAAQpYEyF2rOcvCYAQAAGnS+CBxecBEOb29cDwAAkDyGi/Zmmyt3NtixcioprQgay4vQ9j2Uc95vkhei1FV1/ExuB/6pKdKECiXWRetEU99MQjgaW6RPBWzAlqXjKqJMr3zq3BPpMF5yLdLXUKyy/uaEQIhKH6x2K0HWrpYmQBCpNpRV4BOgDxTRrMY3G449bdRhRPjXgqaiqplgI2OzSPfrzSyKxaNzHHOo+g8yJB/1yuU0ABidUZLSTF4lCDKHbgqARnCOs1+Enrobb14ju04+g5QYwCgoRP/BTsD9gQuvKbfUJvryU16gGA2qNYsiolJ8vrDSyPiACijirpGHZ0RhFLzssZEZcjxAkQXX5nf8EgfLiyRFGncBjV8WmVBrk0JGS14WxKQbL8FgeeilJjUrlWvamSj15KlcM388izD8GVdfsRULarC7nj5iT4XKHf7E7Y/D8mI9TEpqQOVsu/U7qmrcd2mFEXDKoQdeQYz2Eb3VUwmyJhDFHPFNwAeDtT1ulcAtAWQoh0XAY619jowcHnZ7hvflesLjGA==~3420226~3490371; orm-jwt=eyJhbGciOiJSUzI1NiIsImtpZCI6ImI1ZjliMGU1YzM1ZDRiY2NjYjY1YzZkOGQxYzQ2MWI5In0.eyJhY2N0cyI6WyJmY2M0M2QyNS0yYTQwLTQyZmUtYmYwYy0xMDdmZGE2YWJkNjIiXSwiZWlkcyI6eyJleGFjdHRhcmdldCI6InBsYXRmb3JtX3Byb2RfMDZhNTQ2ZDAtNTgwYy00YWQ3LTk5YjMtYjg5ZWExNDZhMmY3IiwiaGVyb24iOiIwNmE1NDZkMC01ODBjLTRhZDctOTliMy1iODllYTE0NmEyZjcifSwiZW52IjoicHJvZHVjdGlvbiIsImV4cCI6MTc1Njc5MDc1OSwiaW5kaXZpZHVhbCI6ZmFsc2UsInBlcm1zIjp7ImFwaWRjIjoidiIsImNuZnJjIjoidiIsImNzc3RkIjoidiIsImVwdWJzIjoidiIsImdlbmFpIjoidiIsImxycHRoIjoidiIsIm5vdGUiOiJjZXYiLCJvcmlvbCI6InYiLCJwbHlscyI6ImNldiIsInByY2giOiJ2IiwidXNhZ2UiOiJjIiwidXNycGYiOiJ2IiwidmlkZW8iOiJ2In0sInN1YiI6IjA2YTU0NmQwLTU4MGMtNGFkNy05OWIzLWI4OWVhMTQ2YTJmNyJ9.Gq9hCmnZ6j9zHaepUkAUw4WVRR_2WrfvRHiE_uG7hvKtqqMFCTGLsn3jblWOvirpog25V133e0-q0yBL4OXZ05H99GrFra64foVeUPi3YxHL47GK_lJ5NS7-s7ets_uKSQIasJ-NUHtt5r9q9G31kB7QZ8GMh6aIjTgH2MR1tFY; bm_sv=80B6CED590CB68F125F3FE6C9C30C40B~YAAQsoEyFx4Q1P2YAQAAqpPWCBzq0Qvo62qUTYkfq04O7uHp/J+E7vXTvF6KylOY5cpWj5OKYde9HoIPNcu13BuPaAMbzxp0E4pK05/tJ7rfkvogr2d7qCWGSgI8urgJGShZRfG5tM1/E/rgDOXq/7rYUEKM3nRJkzTYCBctXvF9gNKupV+ErYYVWeMKPhCNw+BscpUJxx6XzRKtnytfrZH4pmaCJmrn+ksPlLD15aBKCs9VFkae6/YCOy9m28PjdaTf~1'

# Check if weasyprint is installed
if ! command -v weasyprint &> /dev/null; then
  echo "Error: weasyprint is not installed. Install it using:" > /dev/null 2>&1
  echo "  macOS/Linux: pip install weasyprint" > /dev/null 2>&1
  echo "  Windows: pip install weasyprint (use in WSL or with Python installed)" > /dev/null 2>&1
  echo "Alternatively, open ${CHAPTER} in Brave and use Print > Save as PDF." > /dev/null 2>&1
  exit 1
fi

# Download the HTML
curl -s "${BASE_URL}${API_PATH}${CHAPTER}" \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-US,en;q=0.8' \
  -H 'Connection: keep-alive' \
  -b "${COOKIES}" \
  -H 'DNT: 1' \
  -H "Referer: https://learning.oreilly.com/library/view/iron-clad-java/9780071835886/ch01.html" \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Sec-GPC: 1' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Not;A=Brand";v="99", "Brave";v="139", "Chromium";v="139"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -o "${CHAPTER}" > /dev/null 2>&1

# Check if HTML download succeeded
if [ $? -ne 0 ]; then
  echo "Failed to download ${CHAPTER}. Check cookies or network." > /dev/null 2>&1
  exit 1
fi

# Extract image paths (e.g., /api/v2/epubs/urn:orm:book:9780071835886/files/image.jpg)
IMAGE_PATHS=$(grep -o 'src="/api/[^"]*\.\(jpg\|png\|gif\)"' "${CHAPTER}" | sed 's/src="//;s/"$//') > /dev/null 2>&1

# Create a mapping file to track original and local image names
echo > image_mapping.txt 2>/dev/null

# Download each image with unique naming
COUNTER=1
for IMG_PATH in ${IMAGE_PATHS}; do
  IMG_FILENAME="./images/ch${CHAPTER_NUM}-${COUNTER}.$(echo "${IMG_PATH}" | grep -o '[^/]*\.\(jpg\|png\|gif\)$')"
  curl -s "${BASE_URL}${IMG_PATH}" \
    -H 'Accept: image/*,*/*;q=0.8' \
    -H 'Accept-Language: en-US,en;q=0.8' \
    -H 'Connection: keep-alive' \
    -b "${COOKIES}" \
    -H 'DNT: 1' \
    -H "Referer: https://learning.oreilly.com/library/view/iron-clad-java/9780071835886/ch01.html" \
    -H 'Sec-Fetch-Dest: image' \
    -H 'Sec-Fetch-Mode: no-cors' \
    -H 'Sec-Fetch-Site: same-origin' \
    -H 'Sec-GPC: 1' \
    -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36' \
    -H 'sec-ch-ua: "Not;A=Brand";v="99", "Brave";v="139", "Chromium";v="139"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "macOS"' \
    -o "${IMG_FILENAME}" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "${IMG_PATH} -> ${IMG_FILENAME}" >> image_mapping.txt 2>/dev/null
  fi
  ((COUNTER++))
done

# Modify HTML to point to local images
for MAPPING in "$(cat image_mapping.txt)"; do
  ORIGINAL=$(echo "${MAPPING}" | cut -d' ' -f1)
  LOCAL=$(echo "${MAPPING}" | cut -d'>' -f2 | tr -d ' ')
  sed -i '' "s|${ORIGINAL}|${LOCAL}|g" "${CHAPTER}" > /dev/null 2>&1
done

# Convert HTML to PDF using weasyprint
weasyprint "${CHAPTER}" "${PDF_OUTPUT}" > /dev/null 2>&1

if [ $? -eq 0 ]; then
  echo "Converted ${CHAPTER} to ${PDF_OUTPUT}" > /dev/null 2>&1
else
  echo "Failed to convert to PDF. Ensure weasyprint is configured correctly." > /dev/null 2>&1
  echo "Alternatively, open ${CHAPTER} in Brave and use Print > Save as PDF." > /dev/null 2>&1
  exit 1
fi

# Create old folder if it doesn't exist
mkdir -p old > /dev/null 2>&1

# Move HTML and mapping file to old folder, suppressing output
mv -f "${CHAPTER}" image_mapping.txt old/ > /dev/null 2>&1
