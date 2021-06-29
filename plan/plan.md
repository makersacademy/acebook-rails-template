# Log In

alias User="User"
alias Client="Client"
alias Controller="Controller"
alias Model="Model"
alias View="View"

User=>Client:"Users can sign in"
Client->Controller:"GET request for sign in page"
Controller->View:"Passes on GET request"
View=>Client:"Displays the page"

User=>Client:"Completes the sign in form"
Client->Controller:"POST request with params"
Controller->Model:"Submits params and authenticates"
Model->Controller:"Authenticated or not"
Controller=>View:"Redirects to page"

# Registering a New User

alias User="User"
alias Client="Client"
alias Controller="Controller"
alias Model="Model"
alias View="View"

User=>Client:"Users can sign up"
Client->Controller:"GET request for sign up page"
Controller->View:"Passes on GET request"
View=>Client:"Displays the sign up page"

User=>Client:"Completes the registration form"
Client->Controller:"POST request with params"
Controller->Model:"Submits params and creates user"
Model->Controller:"Returns user (Validation)"
Controller=>View:"Redirects to log in page"

# Log Out

alias User="User"
alias Client="Client"
alias Controller="Controller"
alias Model="Model"
alias View="View"

User=>Client:"Users can log out, User clicks log out"
Client->Controller:"POST request to end session"
Controller->View:"GET request for log in page"
View=>Client:"Displays the log in page"

# Display Posts Newest First

alias User="User"
alias Client="Client"
alias Controller="Controller"
alias Model="Model"
alias View="View"

User->Client:"Posts appear with the newest post first"
Client->Controller:"GET request for all posts"
Controller->Model:"Passes on GET request"
Model->Controller:"Returns all posts"
Controller->View:"Retuns all posts to View"
View->Client:"Displays the posts in DateTime order"

# Comments

alias User="User"
alias Client="Client"
alias Controller="Controller"
alias Model="Model"
alias View="View"

User->Client:"Users can comment on posts, complete on comment"
Client->Controller:"POST request with comment"
Controller->Model:"Create comment and save"
Model->Controller:"Return comments"
Controller->View:"Passes all comments"
View->Client:"Displays all comments"