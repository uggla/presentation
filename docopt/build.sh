#!/bin/bash

#sed "/### CODE my_super_tool.py ###/r my_super_tools.py" Docopt.html.src
#sed '/CODE/ r my_super_tools.py' Docopt.html.src
#sed '/CODE/ r oldstyle.py' Docopt.html.src
sed '/### CODE my_super_tool.py ###/ r my_super_tool.py' Docopt.html.src >Docopt.html
sed -i '/### CODE my_super_tool.py ###/ d' Docopt.html
sed -i '/### CODE oldstyle.py ###/ r oldstyle.py' Docopt.html
sed -i '/### CODE oldstyle.py ###/ d' Docopt.html
sed -i '/### CODE argparse_sample.py ###/ r argparse_sample.py' Docopt.html
sed -i '/### CODE argparse_sample.py ###/ d' Docopt.html
sed -i '/### CODE docopt_sample.py ###/ r docopt_sample.py' Docopt.html
sed -i '/### CODE docopt_sample.py ###/ d' Docopt.html
sed -i '/### CODE docopt_sample2.py ###/ r docopt_sample2.py' Docopt.html
sed -i '/### CODE docopt_sample2.py ###/ d' Docopt.html
sed -i '/### CODE docopt_sample2_output.txt ###/ r docopt_sample2_output.txt' Docopt.html
sed -i '/### CODE docopt_sample2_output.txt ###/ d' Docopt.html
