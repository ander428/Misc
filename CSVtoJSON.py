import csv, json, os

__location__ = os.path.realpath(
    os.path.join(os.getcwd(), os.path.dirname(__file__)))

column = ""
csvFile = column+".csv"
file1 = "types.json"
file2 = "typeslist.json"

data1 = {}
data2 = []

# Standardize Keys & Vals
def format(d):
    result = {}
    for key, value in d.items():
        upper_key = key.upper().replace(" ", "_")
        result[upper_key] = value.upper().replace(" ", "_")
    return result

# Add key to match value
with open (os.path.join(__location__, csvFile)) as csvFinal:
    csvReader = csv.DictReader(csvFinal)
    for rows in csvReader:
        id = rows[f'{column}']
        data1[id] = id

        for key, value in data1.items():
            key.upper()
            value.upper()

# add object of uppercase value and original label
with open (os.path.join(__location__, csvFile)) as csvFinal:
    csvReader = csv.DictReader(csvFinal)
    for rows in csvReader:
        id = rows[f'{column}']
        data2.append({
            "value": id.upper(),
            "label": id
        })

# write with format and indented
with open (os.path.join(__location__, file1), 'w') as jsonFile:
    jsonFile.write(json.dumps(format(data1), indent=4, ensure_ascii=False))

# write without format and all in one line
with open (os.path.join(__location__, file2), 'w') as jsonFile:
    jsonFile.write(json.dumps(data2, ensure_ascii=False))
