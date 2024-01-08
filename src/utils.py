import os
import yaml

class Utils:
    def __init__(self):
        pass    
    def read_file(self,file_path: str, file_type: str) -> str:  
        with open(file_path, 'r') as file:
            if file_type == 'yml':
                content = yaml.safe_load(file)
            else:
                content = file.readlines()
        return content

    def read_files(self,path: str, file_type: str) -> str:   
        list_file = [item for item in os.listdir(path) if item.endswith(f'.{file_type}')]
        documentation = []
        if len(list_file) == 1:
            file_path = f"{path}/{list_file[0]}"
            response = self.read_file(file_path, file_type)
            return response
        else:
            for item in list_file:
                file_path = f"{path}/{item}"
                file = self.read_file(file_path, file_type)
                documentation += file
            return '\n'.join(documentation)
