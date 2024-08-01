import yaml
import xml.etree.ElementTree as xml_tree

with open('trailer.yaml','r') as file:
    yaml_data = yaml.safe_load(file)

    view_element = xml_tree.Element('view')
    
trailer_element = xml_tree.SubElement(view_element,'trailers')

link_prefix = yaml_data['link']
xml_tree.SubElement(trailer_element,'title').text = yaml_data['title']
xml_tree.SubElement(trailer_element,'author').text = yaml_data['author']
xml_tree.SubElement(trailer_element,'description').text = yaml_data['description']
xml_tree.SubElement(trailer_element,'image',{'href':link_prefix +yaml_data['image']})
xml_tree.SubElement(trailer_element,'language').text = yaml_data['language']
xml_tree.SubElement(trailer_element,'format').text = yaml_data['format']
xml_tree.SubElement(trailer_element,'link').text = link_prefix
xml_tree.SubElement(trailer_element,'category',{'text':yaml_data['category']})

for item in yaml_data['item']:
    item_element = xml_tree.SubElement(trailer_element,'item')
    xml_tree.SubElement(item_element,'title').text = item['title']
    xml_tree.SubElement(item_element,'description').text = item['description']
    xml_tree.SubElement(item_element,'released').text = item['released']
    xml_tree.SubElement(item_element,'duration').text = item['duration']

    enclosure = xml_tree.SubElement(item_element,'enclosure',{
        'url': link_prefix + item['file'],
        'type': 'video/mp4',
        'size': item['size']
    })

output_tree = xml_tree.ElementTree(view_element)

output_tree.write('trailer.xml',encoding='UTF-8',xml_declaration=True)