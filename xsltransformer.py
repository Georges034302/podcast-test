import lxml.etree as ET

# Load the XML file
xml_file = 'trailer.xml'
xslt_file = 'trailer.xsl'
html_output_file = 'trailer.html'
readme_file = 'README.md'

# Parse XML and XSLT files
xml = ET.parse(xml_file)
xslt = ET.parse(xslt_file)

# Extract the base URL from the XML file
base_url = xml.findtext('trailers/link')

# Transform XML using XSLT
transform = ET.XSLT(xslt)
html = transform(xml)

# Convert the HTML to string and append the base URL to links
html_str = ET.tostring(html, pretty_print=True, method='html').decode('utf-8')
full_url = f"{base_url.rstrip('/')}/trailers.html"

# Update the HTML content with the full URL
html_str = html_str.replace('<a href="{view/trailers/link}">Visit Trailer Viewer</a>', f'<a href="{full_url}">Visit Trailer Viewer</a>')

# Write the updated HTML content to a file
with open(html_output_file, 'w') as f:
    f.write(html_str)

# Append the full URL to the README.md file
with open(readme_file, 'a') as f:
    f.write(f"\nYou can view the trailers [here]({full_url}).\n")

print(f'HTML file generated: {html_output_file}')
print(f'Full URL appended to README.md: {full_url}')