import streamlit as st
import vanna as vn
from train_model import Model

@st.cache_resource(ttl=3600)
def setup_connexion():
    if 'model_status' not in st.session_state:
        st.session_state.model_status = False

    if "vanna" in st.secrets:
        key =  st.secrets["vanna"]["key"]
        st.session_state.model_name = st.secrets["vanna"]["model_name"]
        print(key,st.session_state.model_name )

        # model object
        model = Model(st.session_state.model_name) 
        api_key = vn.get_api_key(key)
        vn.set_api_key(api_key)

        # model
        vn.set_model(st.session_state.model_name )
        if st.session_state.model_status == False:
            model.train()
            st.session_state.model_status = True
    else:
        raise Exception("No API key found")


def main():
    setup_connexion()
    st.session_state.model_name = st.secrets["vanna"]["model_name"]
    model = Model(model_name=st.session_state.model_name)

    st.title("💬 Chatbot")
    caption_placeholder = st.empty()

    # Initialize the user name if it doesn't exist
    if "user_name" not in st.session_state or not st.session_state.user_name:
        caption_placeholder.caption("🚀 A streamlit chatbot powered by Vanna-AI")
        with st.form(key='user_form'):
            user_name = st.text_input("Please enter your name:")
            user_avatar = st.radio("Please choose an avatar:", ["🐼", "🐶", "🐱", "🦊","🦄","🌸","⭐","🌈","❄️","👻","👾"], 
                                    index=0,
                                    horizontal=True,)
            submit_button = st.form_submit_button(label='Start Chat')
        if submit_button and user_name:
            st.session_state.user_name = user_name
            st.session_state.user_avatar = user_avatar
            caption_placeholder.caption(f"🚀 Hi {st.session_state.user_avatar} {st.session_state.user_name}, welcome to the chatbot powered by Vanna-AI")
            handle_chat(model=model)
    else:
        handle_chat(model=model)

def handle_chat(model):
    caption_placeholder = st.empty()
    caption_placeholder.caption(f"Hi {st.session_state.user_avatar} {st.session_state.user_name}, welcome to the chatbot powered by Vanna-AI")
    
    # Initialize the explanation status if it doesn't exist
    if "explanation_status" not in st.session_state:
        st.session_state.explanation_status = False

    # Initialize the chat messages history
    if "messages" not in st.session_state.keys(): 
        st.session_state.messages = [
            {"role": "assistant", "content": "Ask me a question and I can answer you with a SQL Query!", "avatar": "🤖"}
        ]
    # Initialize the prompt status if it doesn't exist
    if prompt := st.chat_input("Your question"): 
        st.session_state.messages.append({"role": "user", "content": prompt, "avatar": st.session_state.user_avatar})
    
    # Display the prior chat messages
    for message in st.session_state.messages: 
        with st.chat_message(message["role"], avatar=st.session_state.user_avatar):
            st.write(message["content"])

    # If last message is not from assistant, generate a new response
    if st.session_state.messages[-1]["role"] != "assistant":
        with st.spinner("Thinking..."):
            # ask the model
            response = model.ask(st.session_state.messages[-1]["content"])
            # update the explanation status
            st.session_state.explanation_status = True
            # update the last message
            st.session_state.last_message = response

        # Print the response as a new message from the assistant
        chatbot_message_response = st.chat_message("assistant", avatar="🤖")
        chatbot_message_response.code(response, language="sql", line_numbers=True)
        message =  {"role": "assistant", "content": response}

        # Add response to message history
        st.session_state.messages.append(message) 

    if st.session_state.explanation_status:
        if st.button('Do you want an explanation of the query?'):
            with st.spinner("Thinking..."):
                # ask the model for an explanation of the last query
                explanation = model.explain(st.session_state.last_message)
                
                # print the explanation as a new message from the assistant
                explanation_message_response = st.chat_message("assistant", avatar="🤖")
                explanation_message_response.write(explanation)

                # add explanation to message history
                explanation_message = {"role": "assistant", "content": explanation}
                st.session_state.messages.append(explanation_message)


if __name__ == "__main__":
    main()