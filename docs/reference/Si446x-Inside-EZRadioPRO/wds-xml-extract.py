# Copyright (c) 2020 Adrian Studer
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

import argparse

elements = ["SPITools", "SPITools_PRO", "SPITools_PRO2",
			"API", "DDT_Table", "root"]

def extract_file(data_src, element_name):
	start_str = "<" + element_name + " "
	start_str2 = "<" + element_name + ">"
	end_str = "</" + element_name + ">"
	start_bin = start_str.encode("utf-8")
	start_bin2 = start_str2.encode("utf-8")
	end_bin = end_str.encode("utf-8")

	start_pos = data_src.find(start_bin)
	if (start_pos == -1):
		start_pos = data_src.find(start_bin2)
	end_pos = data_src.find(end_bin)
	if (start_pos != -1):
		start_pos = data_src.rfind("<?xml".encode("utf-8"), 0, start_pos)
	if (start_pos == -1) or (end_pos == -1) or (end_pos < start_pos):
		print("%s not found." % element_name)
	else:
		print("%s found from %d to %d." % (element_name, start_pos, end_pos));
	file_name = element_name + ".xml"
	xml_file = open(file_name, "wb")
	xml_file.write(data_src[start_pos:(end_pos+len(end_bin))])
	xml_file.close()

if __name__ == "__main__":
	parser = argparse.ArgumentParser(description="Extracts XML files hidden in SiLabs Wireless Development Suite.")
	parser.add_argument("wds", type=argparse.FileType("rb", 0),
						help="Path and name of WDS executable from which to extract XML files.")
	args = parser.parse_args()

	# read file
	data_src = args.wds.read()
	print("%d bytes read from WDS." % (len(data_src)))
	args.wds.close()

	# extract files
	for element_name in elements:
		extract_file(data_src, element_name)
