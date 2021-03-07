-- Arrays and tables in Lua

-- Initializing the array
array = {}

for i=1,3 do
   array[i] = {}
	
   for j=1,3 do
      array[i][j] = i*j
   end
end


-- Accessing the array
for i=1,3 do

   for j=1,3 do
      print(sin(array[i][j]))
   end
end
