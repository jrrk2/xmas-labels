# xmas-labels
Brain-dead hack to address the Christmas Card labels problem

Imagine it's the night before the postage deadline, the Office 365 Desktop license has run out, LibreOffice Mail Merge is crashing,
Cloud based word processing tools seem not to support this legacy functionality from the 1970s, why would they ?
what else is there to do but come up with a custom hack to get those labels printed and out of the door ?

This brain-dead solution is for Avery L7163 A4-labels, your mileage may vary.

It requires OCaml and xml-light to be installed (typically via opam).
This version also runs under OSX AppleSilicon, using LibreOffice-Vanilla from the AppleStore.

Those who use Linux should have no difficulty, Legacy O/S such as Windows Users are at a disadvantage in that developers tools are not included by default.

All This program does is take a spreadsheet (in flat XML format) like this:

|Name|address1|address2|address3|address4|
|---|---|---|---|---|
|John Doe|8 Oxford Rd|Chesterton|Cambridge|CB1 1ZZ|
|POTUS|The Whitehouse|Penn Avenue|Washington|USA|
|Boris|10 Downing Street|Whitehall|London|W1 1AA|
|Chairman Mao|The Royal Palace|The Forbidden City|Beijing|China|

and converts it to a word processor file (in flat XML format):

![](https://github.com/jrrk2/xmas-labels/raw/master/xmas-labels.jpg)

The enclosed version only deals with 10 lines per label due to extreme laziness. A proper scalable solution is left to the student in the unlikely event of 
anybody else but me being interested. By the time I documented that bug, it could have been fixed (by initially storing the labels in a list instead of an array)
