GitNotes

##GitNotes

• When you create a .gitignore files you have already created are not picked up by it, so to circumvent this, for files you want to be recognized by your git ignore, you just `mv filename filename` and this refresh’s git’s tracking of the files, essentially making your old file a new file that git picks up to ignore
   • or put it inside .git/info/exclude (same as gitignore in your home)
