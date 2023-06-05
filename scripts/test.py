_empty = object()

def func(x=_empty):
  if x is _empty: return 0 # default argument value
  elif x is None:  return 1 # argument was provided and it's None
  else: return 2

dings = object()
print(func())
print(func(None))
print(func(2))
