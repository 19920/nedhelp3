
var RequestsList = React.createClass({
    getInitialState: function() {
  return (
   requestsList: null,
   requestloaded: false
  )
 },
 componentDidMount(){
        fetch('/requests')
          .then(res => res.json())
          
          .then(res => {
             this.setState({
                 requestsList:res.requests,
                 requestsLoaded: true,
             })
             
          }).catch(err => console.log(err))
    },

    MapRequests:function(){
        const request = this.state;
        return  this.state.requestList.map(request=>{
            return(
                <fieldset className ="request box-shadow-dark container" key ={request.id}>
                       <p>Title:<strong>{request.title}</strong><br/>
                       <span>Description:<strong>{request.description}</strong></span><br/>
                       </p>

                     <button><Link to={{pathname: `/request/${request.id}`,
                         state: {request: request.id}
                       }}>View</Link></button>
                     <a href="/chatt"  type="button"className="text-primary" onClick={this.handleVolunteer.bind(this)} disabled={this.status}>Volunteer</a>



                </fieldset>
            )
        })
    },

    render:function(){
        return(
        <div className ="request-list container">
        <h3>Requests</h3>
        {(this.state.requestsLoaded)
        ?this.renderRequests()
        :<p>Loading...</p>
        }
        </div>
        )
    }
})