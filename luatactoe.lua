--lua tic tac toe
--2020 Rygel Dagenais
--made while working on a lua chess program

board = {0,0,0,0,0,0,0,0,0}
xmove = true

function reset()
  board = {0,0,0,0,0,0,0,0,0}
  xmove = true
end

function genmoves()
  local valid = {}
  for i = 1,9 do
    if board[i] == 0 then
      table.insert(valid,i)
    end
  end
  return valid
end

function setmove(n)
  if xmove == true then
    board[n] = 1
  else
    board[n] = 2
  end
  xmove = not xmove
end

function no_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return false
        end
    end
    return true
end


function getmove()
  print(makeboard())
  local msg = ''
  if xmove then
    msg = '\nX to move: '
  else
    msg = '\nO to move: '
  end
  local v = genmoves()
  local a = 0
  while no_value(v,a) do
    io.write(msg)
    a = io.read('*n')
  end
  return a
end

function makeboard()
  local b = {}
  for i = 1,9 do
    if board[i] == 0 then
      table.insert(b,' ')
    elseif board[i] == 1 then
      table.insert(b,'X')
    else
      table.insert(b,'O')
    end
  end
  return string.format('%s|%s|%s\n-+-+-\n%s|%s|%s\n-+-+-\n%s|%s|%s',b[1],b[2],b[3],b[4],b[5],b[6],b[7],b[8],b[9])
end

function checkwin()
  local all = {
  ck(1,2,3),
  ck(4,5,6),
  ck(7,8,9),
  ck(1,4,7),
  ck(2,5,8),
  ck(3,5,9),
  ck(1,5,9),
  ck(3,5,7)}
  for i = 1,8 do
    if all[i] ~= 0 then
      return all[i]
    end
  end
  return 0
end

function ck(a,b,c)
  if board[a] == board[b] then
    if board[b] == board[c] then
      return board[c]
    end
  end
  return 0
end

function playboth()
  reset()
  local v = false
  for i = 1,9 do
    setmove(getmove())
    a = checkwin()
    if a == 1 then
      print(makeboard())
      print('\nX wins!')
      v = true
      break
    elseif a == 2 then
      print(makeboard())
      print('\nO wins!')
      v = true
      break
    end
  end
  if v == false then
    print(makeboard())
    print('\nIt\'s a tie...')
  end
end

playboth()
