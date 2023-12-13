filename = input('Filename of item?\n')
filename = filename.lower()

itemname = input('Name of item?\n')
itemmodel = input('Item model path?\n')
itemdesc = input('Item description?\n')
itemwidth = input('Item width?\n')
itemheight = input('Item height?\n')

item = open("gamemodes\stalkerrp\schema\items\junk/sh_" + filename + ".lua", 'w')

item.write('ITEM.name = "' + itemname + '"\n')
item.write('ITEM.model = "' + itemmodel + '"\n')
item.write('ITEM.description = "' + itemdesc + '"\n')
item.write('ITEM.category = "junk"\n')
item.write('ITEM.flag = "1"\n')
item.write('ITEM.price = 5\n')
item.write('ITEM.width = ' + itemwidth + '\n')
item.write('ITEM.height = ' + itemheight + '\n')