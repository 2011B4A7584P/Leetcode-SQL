import git

local_repository_location = 'C:/Users/91702/Desktop/Leetcode-SQL'

repo = git.Repo(local_repository_location)

for file in repo.untracked_files:
    print()
    print('Untracked file for current git op')
    print('File : ', file)
    
    repo.index.add(file)
    problem_category, problem_statement = file.split('/')[0], (file.split('/')[1]).split('.')[0]
    
    print('Leetcode problem category : ', problem_category)
    print('Leetcode problem : ', problem_statement)
    
    if '_' in problem_category:
        repo.index.commit('added solution to ' + problem_statement + ' leetcode category ' + problem_category + ' problem for review')
    else:
        repo.index.commit('added solution to ' + problem_statement + ' leetcode category ' + problem_category + ' problem')
    
    repo.remote.origin.push()
