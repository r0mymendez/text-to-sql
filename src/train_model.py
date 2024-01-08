import vanna as vn
import os
from utils import Utils

class Model():
    def __init__(self, model_name):
        self.model_name = model_name

    def train(self):
        try:
            utils = Utils()
            # train vanna
            print(os.listdir())
            vn.train(ddl=utils.read_files(path="db/ddl", file_type=".sql"))
            vn.train(documentation=utils.read_files(path="db", file_type=".md"))
            vn.train(sql=utils.read_files(path="db/queries", file_type=".sql"))
            return True
        except Exception as e:
            print(e)
            return False

    def ask(self, question):
        print(question)
        return vn.generate_sql(question=question)

    def explain(self,query):
        return vn.generate_explanation(sql=query)