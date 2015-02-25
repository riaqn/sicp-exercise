explicit dispatch:
to add a new type, a condition clause must be added to every function.
to add a new function, a new general function must be written, with many condition clause according to types

data-directed:
to add a new type, the new row in the mapping table must be filled
to add a new function, the new column in the mapping table must be filled

message-passsing
to add a new type, you just need to write a new "make" function, with all operations in the function

to add a new operation, you need to add the operation function in the "make" function

for a system that new types often be added, message-passsing is more appropriate

for a system that new operation often, explicit dispatch is better.
