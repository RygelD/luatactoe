--lua tic tac toe
--2020 Rygel Dagenais
--made while working on a lua chess program


function new()
  return {0,0,0,0,0,0,0,0,0,xmove=true}
end

function genmoves(board)
  local valid = {}
  for i = 1,9 do
    if board[i] == 0 then
      table.insert(valid,i)
    end
  end
  return valid
end

function setmove(board,n)
  if board['xmove'] == true then
    board[n] = 1
  else
    board[n] = 2
  end
  board['xmove'] = not board['xmove']
end

function no_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return false
        end
    end
    return true
end


function getmove(board)
  print(makeboard(board))
  local msg = ''
  if board['xmove'] then
    msg = '\nX to move: '
  else
    msg = '\nO to move: '
  end
  local v = genmoves(board)
  local a = 0
  while no_value(v,a) do
    io.write(msg)
    a = io.read('*n')
    io.write('\n\n=====\n\n')
  end
  return a
end

function makeboard(board)
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

function checkwin(board)
  local all = {
  ck(board,1,2,3),
  ck(board,4,5,6),
  ck(board,7,8,9),
  ck(board,1,4,7),
  ck(board,2,5,8),
  ck(board,3,6,9),
  ck(board,1,5,9),
  ck(board,3,5,7)}
  for i = 1,8 do
    if all[i] ~= 0 then
      return all[i]
    end
  end
  return 0
end

function ck(board,a,b,c)
  if board[a] == board[b] then
    if board[b] == board[c] then
      return board[c]
    end
  end
  return 0
end

function playboth()
  board = new()
  local v = false
  for i = 1,9 do
    setmove(board,getmove(board))
    a = checkwin(board)
    if a == 1 then
      print(makeboard(board))
      print('\nX wins!')
      v = true
      break
    elseif a == 2 then
      print(makeboard(board))
      print('\nO wins!')
      v = true
      break
    end
  end
  if v == false then
    print(makeboard(board))
    print('\nIt\'s a tie...')
  end
end

function evaluate(board,player,depth)
  local z = checkwin(board) 
  if player == z then
    return {1000,nil}
  elseif z ~= 0 then
    return {-1000,nil}
  end
  local a = getmove(board)
  local p = {}
  for i = 1,#a do
    local a = false
  end
end


playboth()
