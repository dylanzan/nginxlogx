local pb = require "pb"
local protoc = require "protoc"
local serpent = require("serpent")

-- 直接载入schema (这么写只是方便, 生产环境推荐使用 protoc.new() 接口)
assert(pb.loadfile "person.pb")

-- lua 表数据
local data = {
   name = "ilse",
   age  = 18,
   contacts = {
      { name = "alice", phonenumber = 12312341234 },
      { name = "bob",   phonenumber = 45645674567 }
   }
}

-- 将Lua表编码为二进制数据
local bytes = assert(pb.encode("Person", data))
print(pb.tohex(bytes))

-- 再解码回Lua表
local data2 = assert(pb.decode("Person", bytes))
print(require "serpent".block(data2))