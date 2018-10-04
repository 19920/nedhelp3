
var NewRequest = React.createClass({
    getInitialState:function(){
        return{
            title:"",
            description:"",
            request_type:"",
            address: "",
            }
        this.handleChange = this.handleChange.bind(this);
    },
    handleChange:function(e){
        const name = e.target.name;
        const value  = e.target.value;
        this.setState({
            [name]: value,
        });
    },
    addRequest:function(e,data){
          fetch('/requests',{
            method: 'POST',
            headers: {
              'Content-Type' : 'application/json',
            },
           body: JSON.stringify({
             request: data,
           }),
          }).then(res => res.json())
          .catch(error=>console.log(error));
            
},
    render:function(){
        return(
            <div className="container ">
             <h1>New Request</h1>

            <div className="row">


            <div className="">

                <form onSubmit={(e)=>this.state.addRequest(e,this.state)}>

                <div className="form-group ">
                    <label>Title</label><br/>
                    <input  type="text" name = "title"  value = {this.state.title} onChange = {this.handleChange} />
                </div>
                <div className="form-group">
                    <label>description</label><br/>
                    <textarea type="text" name = "description"  value = {this.state.description} onChange = {this.handleChange}></textarea>
                </div>
                <div className="form-group">
                    <label>request_type</label><br/>
                    <select className="dropdown" >
                        <option value = {this.state.request_type} onChange = {this.handleChange}>Help</option>
                        <option value = {this.state.request_type} onChange = {this.handleChange}>Material</option>
                        </select>
                </div>
                <div className="form-group">
                    <label >address</label><br/>
                    <input type="text" name = "address"  value = {this.state.address} onChange = {this.handleChange} />
                </div>
                <button type="submit" className="btn btn-primary">Save</button>

                </form>
                </div>
                </div>
                </div>
        );
    }
})
